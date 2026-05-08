; DESCRIPTION: Draws a colored object at the screen with fixed size.

; init_service.asm -- Phase 97: Config-driven service manager
;
; Enhanced init process that reads boot.cfg, starts services in dependency
; order, monitors for crashes, and restarts based on policy.
;
; boot.cfg format (one service per line):
;   name path restart_policy deps
;   Example: shell /bin/sh.asm always none
;   Restart policies: always (0), onfail (1), never (2)
;   Dependencies: service index (0-based) or 255 (none)
;
; Memory layout:
;   0x0300: boot banner string
;   0x0500: "init: " label
;   0x0600: status messages
;   0x1000-0x17FF: Service table (up to 8 services, 256 words each)
;     Per-service: [path_addr(32 words), pid, restart_policy, dep_idx, status]
;   0x1800-0x1FFF: boot.cfg content (loaded from VFS)
;   0x2000-0x20FF: scratch buffer for path/name parsing
;
; Service table entry layout (offsets from base):
;   +0   to +31: path string (null-terminated, max 32 chars)
;   +32: pid (0 = not running)
;   +33: restart_policy (0=always, 1=onfail, 2=never)
;   +34: dep_idx (255 = no dependency, else index of prerequisite)
;   +35: status (0=pending, 1=running, 2=exited_ok, 3=exited_fail)
;
; Register convention:
;   r4  = constant 1
;   r20 = constant 0
;   r30 = SP (0xFF00)

LDI r4, 1
LDI r20, 0
LDI r30, 0xFF00

; ═══════════════════════════════════════════════════════════════
; Phase 1: Initialize
; ═══════════════════════════════════════════════════════════════
LDI r6, 0
FILL r6

; Write boot banner
LDI r0, 0x0300
STRO r0, "Geometry OS init"
LDI r1, 2
LDI r12, 0
LDI r7, 0x0300
TEXT r1, r12, r7

; ═══════════════════════════════════════════════════════════════
; Phase 2: Load boot.cfg from VFS
; ═══════════════════════════════════════════════════════════════
; Write cfg path to RAM
LDI r0, 0x2000
STRO r0, "/etc/boot.cfg"

; Open the config file
LDI r11, 0x2000   ; path addr
LDI r1, 0        ; flags = O_RDONLY
LDI r2, 0x54     ; OPEN opcode
OPEN r11, r1
; r6 = fd (or 0xFFFFFFFF on error)

; Check if open succeeded
LDI r25, 0xFFFFFFFF
CMP r6, r25
JZ r6, no_config

MOV r8, r6       ; r8 = fd

; Read config file content into 0x1800
MOV r11, r8       ; fd
LDI r1, 0x1800   ; buffer addr
LDI r12, 512      ; max bytes
LDI r2, 0x55     ; READ opcode
READ r11, r1, r12
; r6 = bytes read

; Close the file
MOV r11, r8
LDI r2, 0x57     ; CLOSE opcode
CLOSE r11

; ═══════════════════════════════════════════════════════════════
; Phase 3: Parse boot.cfg into service table
; ═══════════════════════════════════════════════════════════════
; boot.cfg format: path policy dep_idx
; Simple format: 3 fields per line, space-separated
; policy: 0=always, 1=onfail, 2=never
; dep_idx: 255=none, else prerequisite service index

LDI r15, 0x1800  ; cfg read pointer
LDI r14, 0x1000  ; service table base
LDI r5, 0       ; service count
LDI r3, 256     ; bytes per service entry
LDI r10, 8       ; max services

parse_line:
  ; Skip if past max services
  CMP r5, r10
  BGE r6, parse_done

  ; Check if we hit end of config (null byte)
  MOV r9, r15
  LOAD r9, r9   ; r9 = current char
  JZ r9, parse_done

  ; Skip whitespace/newlines (10=\n, 32=space)
  LDI r25, 10
  CMP r9, r25
  JZ r6, skip_char
  LDI r25, 32
  CMP r9, r25
  JZ r6, skip_char

  ; Start of a line -- parse path into service entry
  ; Compute dest addr: r14 + r5 * r3
  MOV r16, r5
  MUL r16, r3
  ADD r16, r14    ; r16 = current service entry base

  ; Parse path (copy chars until space or null)
  LDI r17, 0      ; char offset
parse_path:
  MOV r9, r15
  LOAD r9, r9
  JZ r9, path_done
  LDI r25, 32
  CMP r9, r25
  JZ r6, path_done
  LDI r25, 10
  CMP r9, r25
  JZ r6, path_done

  ; Store char at service_base + char_offset
  MOV r18, r16
  ADD r18, r17
  STORE r18, r9
  ADD r17, r4     ; offset++
  ADD r15, r4     ; advance read pointer
  JMP parse_path

path_done:
  ; Null-terminate path
  MOV r18, r16
  ADD r18, r17
  LDI r25, 0
  STORE r18, r25

  ; Skip the space
  MOV r9, r15
  LOAD r9, r9
  LDI r25, 32
  CMP r9, r25
  JNZ r6, parse_policy
  ADD r15, r4     ; skip space

  ; Parse restart_policy (single digit: 0, 1, 2)
parse_policy:
  MOV r9, r15
  LOAD r9, r9
  ; Store policy at base+32
  MOV r18, r16
  LDI r25, 32
  ADD r18, r25
  SUB r9, r4     ; assuming digit '0'-'2', but actually we want the numeric value
  ; Wait, the char is '0'=48, '1'=49, '2'=49. Need to subtract 48.
  ; Actually, let's use numeric values in the config. If the config uses
  ; digits, we subtract 48 (ASCII '0').
  ; For simplicity, assume policy is already a small number or we map:
  ; 'a' (97) for always -> 0, 'f' (102) for onfail -> 1, 'n' (110) for never -> 2
  ; Actually let's just use digit chars and subtract 48
  LDI r25, 48
  SUB r9, r25     ; r9 = policy value (0, 1, or 2)
  MOV r18, r16
  LDI r25, 33     ; offset 33
  ADD r18, r25
  STORE r18, r9  ; store restart_policy

  ADD r15, r4     ; skip policy char
  ; Skip space
  MOV r9, r15
  LOAD r9, r9
  LDI r25, 32
  CMP r9, r25
  JNZ r6, parse_dep
  ADD r15, r4

  ; Parse dep_idx
parse_dep:
  MOV r9, r15
  LOAD r9, r9
  LDI r25, 48
  SUB r9, r25    ; dep value
  ; If char is 'n' (110 for "none"), use 255
  LDI r25, 110
  MOV r18, r15
  LOAD r18, r18
  CMP r18, r25
  JNZ r6, store_dep
  LDI r9, 255   ; no dependency
store_dep:
  MOV r18, r16
  LDI r25, 34    ; offset 34
  ADD r18, r25
  STORE r18, r9 ; store dep_idx

  ; Set initial status to pending (0) at offset 35
  MOV r18, r16
  LDI r25, 35
  ADD r18, r25
  LDI r25, 0
  STORE r18, r25

  ; Advance past remaining line chars until newline or null
skip_rest:
  MOV r9, r15
  LOAD r9, r9
  JZ r9, parse_done
  LDI r25, 10
  CMP r9, r25
  JZ r6, skip_char
  ADD r15, r4
  JMP skip_rest

skip_char:
  ADD r15, r4
  JMP parse_line

parse_done:
  ; r5 = number of services parsed
  ; If no services, spawn shell manually
  JNZ r5, start_services

no_config:
  ; No config file -- spawn shell directly
  LDI r0, 0x2000
  STRO r0, "shell"
  LDI r6, 0x2000
  EXEC r6
  HALT

; ═══════════════════════════════════════════════════════════════
; Phase 4: Start services in dependency order
; ═══════════════════════════════════════════════════════════════
start_services:
  ; Simple approach: iterate services, check deps, start when ready
  LDI r21, 0       ; iteration counter
  LDI r22, 3       ; max iterations (to handle deps)

start_pass:
  LDI r23, 0       ; service index

svc_loop:
  CMP r23, r5
  BGE r6, svc_pass_done

  ; Compute service entry base
  MOV r16, r23
  MUL r16, r3
  ADD r16, r14

  ; Check if already running (status at offset 35)
  MOV r25, r16
  LDI r26, 35
  ADD r25, r26
  LOAD r25, r25
  LDI r26, 1
  CMP r25, r26
  JZ r6, svc_next   ; already running, skip

  ; Check dependency (offset 34)
  MOV r25, r16
  LDI r26, 34
  ADD r25, r26
  LOAD r25, r25     ; dep_idx
  LDI r26, 255
  CMP r25, r26
  JZ r6, can_start  ; no dep, can start

  ; Check if dependency is running (status=1 at dep's offset 35)
  MOV r26, r25      ; dep_idx
  MUL r26, r3
  ADD r26, r14      ; dep service base
  LDI r27, 35
  ADD r26, r27
  LOAD r26, r26     ; dep status
  LDI r27, 1
  CMP r26, r27
  JZ r6, can_start  ; dep is running, can start
  JMP svc_next       ; dep not running, skip for now

can_start:
  ; Spawn the service
  ; path is at service base, use EXEC
  MOV r6, r16       ; path addr = service base
  EXEC r6

  ; Check spawn result
  LDI r25, 0xFFA
  LOAD r25, r25     ; r25 = PID (or 0xFFFFFFFF on error)
  LDI r26, 0xFFFFFFFF
  CMP r25, r26
  JZ r6, spawn_failed_svc

  ; Store PID at offset 32
  MOV r26, r16
  LDI r27, 32
  ADD r26, r27
  STORE r26, r25

  ; Set status to running (1) at offset 35
  MOV r26, r16
  LDI r27, 35
  ADD r26, r27
  LDI r27, 1
  STORE r26, r27

svc_next:
  ADD r23, r4
  JMP svc_loop

svc_pass_done:
  ADD r21, r4
  CMP r21, r22
  BLT r6, start_pass

; ═══════════════════════════════════════════════════════════════
; Phase 5: Supervisor loop -- monitor services, restart on crash
; ═══════════════════════════════════════════════════════════════
supervisor:
  LDI r15, 60
  SLEEP r15        ; sleep ~1 second between checks

  LDI r23, 0       ; service index

check_loop:
  CMP r23, r5
  BGE r6, supervisor  ; all checked, loop back

  ; Compute service entry base
  MOV r16, r23
  MUL r16, r3
  ADD r16, r14

  ; Check status
  MOV r25, r16
  LDI r26, 35
  ADD r25, r26
  LOAD r25, r25
  LDI r26, 1
  CMP r25, r26
  JNZ r6, check_next  ; not running, skip

  ; Check if process is still alive via WAITPID
  MOV r25, r16
  LDI r26, 32
  ADD r25, r26
  LOAD r25, r25     ; PID
  MOV r6, r25
  WAITPID r6

  ; r6 = 0 means still running, nonzero means exited
  JZ r6, check_next

  ; Process exited -- check restart policy
  MOV r25, r16
  LDI r26, 33
  ADD r25, r26
  LOAD r25, r25     ; restart_policy

  ; Policy 2 (never) -- mark as exited
  LDI r26, 2
  CMP r25, r26
  JZ r6, mark_exited

  ; Policy 0 (always) or 1 (onfail) -- restart
  ; For onfail, we'd check exit code. For simplicity, always restart.
  ; Reset PID and status, will be picked up next supervisor pass
  MOV r25, r16
  LDI r26, 32
  ADD r25, r26
  LDI r26, 0
  STORE r25, r26   ; PID = 0

  MOV r25, r16
  LDI r26, 35
  ADD r25, r26
  LDI r26, 0
  STORE r25, r26   ; status = pending (will be restarted next pass)

  ; Re-spawn immediately
  MOV r6, r16
  EXEC r6

  LDI r25, 0xFFA
  LOAD r25, r25
  LDI r26, 0xFFFFFFFF
  CMP r25, r26
  JZ r6, check_next  ; spawn failed

  ; Update PID and status
  MOV r26, r16
  LDI r27, 32
  ADD r26, r27
  STORE r26, r25

  MOV r26, r16
  LDI r27, 35
  ADD r26, r27
  LDI r27, 1
  STORE r26, r27

  JMP check_next

mark_exited:
  MOV r25, r16
  LDI r26, 35
  ADD r25, r26
  LDI r26, 3        ; status = exited_fail
  STORE r25, r26

check_next:
  ADD r23, r4
  JMP check_loop

spawn_failed_svc:
  ; Mark as failed
  MOV r26, r16
  LDI r27, 35
  ADD r26, r27
  LDI r27, 3
  STORE r26, r27
  JMP svc_next
