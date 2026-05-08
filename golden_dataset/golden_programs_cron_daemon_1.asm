; DESCRIPTION: This GeOS assembly code implements a frame-based cron daemon that reads a schedule from the virtual file system (VFS) and spawns programs at regular intervals defined in a crontab file. The crontab format specifies intervals and program names, and the daemon manages up to eight scheduled entries, checking each frame to determine if a program should be executed.

; cron_daemon.asm -- Phase 101: Cron Daemon
;
; A frame-based cron daemon that reads a schedule from VFS and spawns
; programs at regular intervals. Like Unix cron but using frame counts.
;
; Crontab format: "interval program_name\n" per line (text)
; Example: "100 hello\n" means run hello.asm every 100 frames
;
; Memory layout:
;   0x1000: crontab filename string ("crontab")
;   0x2000: read buffer for crontab file contents
;   0x4000-0x43FF: schedule table (8 entries, 64 words each)
;     Entry: [interval(1), last_run(1), name_len(1), padding(1), name(60)]
;   0x5000: program name buffer for EXEC
;   0xFA0: reload flag
;
; Uses: LDI, STORE, LOAD, MOV, ADD, SUB, MUL, AND, CMP, BLT, BGE,
;   JZ, JNZ, JMP, CALL, RET, PUSH, POP, OPEN, READ, CLOSE, FRAME, EXEC

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Phase 1: Initialize
    ; Clear screen
    LDI r5, 0
    FILL r5

    ; Initialize stack pointer
    LDI r30, 0xFF00

    ; Write "crontab" filename to 0x1000
    LDI r6, 0x1000
    LDI r15, 99
    STORE r6, r15
    LDI r6, 0x1001
    LDI r15, 114
    STORE r6, r15
    LDI r6, 0x1002
    LDI r15, 111
    STORE r6, r15
    LDI r6, 0x1003
    LDI r15, 110
    STORE r6, r15
    LDI r6, 0x1004
    LDI r15, 116
    STORE r6, r15
    LDI r6, 0x1005
    LDI r15, 97
    STORE r6, r15
    LDI r6, 0x1006
    LDI r15, 98
    STORE r6, r15
    LDI r6, 0x1007
    LDI r15, 0
    STORE r6, r15

    ; Clear schedule table (512 words at 0x4000)
    LDI r6, 0x4000
    LDI r13, 0
    LDI r4, 0x4200
clear_table:
    STORE r6, r13
    LDI r12, 1
    ADD r6, r12
    CMP r6, r4
    BLT r5, clear_table

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Read and parse crontab
    ; ═══════════════════════════════════════════════════════════════
read_crontab:
    LDI r7, 0x1000
    LDI r10, 0
    OPEN r7, r10
    MOV r11, r5

    ; Check error
    LDI r6, 0xFFFFFFFF
    CMP r11, r6
    JZ r5, no_crontab

    ; Read into 0x2000
    LDI r8, 0x2000
    LDI r2, 512
    READ r11, r8, r2

    CLOSE r11

    ; Parse entries
    CALL parse_crontab

no_crontab:
    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Main loop -- check schedule, spawn jobs
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Get current TICKS
    LDI r6, 0xFFE
    LOAD r6, r6

    ; Check each entry (max 8)
    LDI r15, 0
check_entry:
    ; Entry base = 0x4000 + index * 64
    MOV r13, r15
    LDI r12, 64
    MUL r13, r12       ; r13 = index * 64
    LDI r12, 0x4000
    ADD r13, r12       ; r13 = 0x4000 + index * 64

    ; interval = entry[0]
    LOAD r1, r13
    JZ r1, next_entry

    ; last_run = entry[1]
    MOV r4, r13
    LDI r16, 1
    ADD r4, r16
    LOAD r16, r4

    ; elapsed = ticks - last_run
    MOV r17, r6
    SUB r17, r16
    CMP r17, r1
    BLT r5, next_entry

    ; Time to spawn! Copy name to 0x5000
    PUSH r31
    CALL copy_name
    POP r31

    ; EXEC
    LDI r7, 0x5000
    EXEC r7

    ; Update last_run
    STORE r4, r6

next_entry:
    LDI r12, 1
    ADD r15, r12
    LDI r12, 8
    CMP r15, r12
    BLT r5, check_entry

    ; Check reload flag
    LDI r6, 0xFA0
    LOAD r6, r6
    LDI r15, 0x43524F
    CMP r6, r15
    JNZ r5, skip_reload
    LDI r6, 0xFA0
    LDI r15, 0
    STORE r6, r15
    JMP read_crontab

skip_reload:
    FRAME
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_crontab: Parse buffer at 0x2000 into table at 0x4000
; ═══════════════════════════════════════════════════════════════
parse_crontab:
    PUSH r31

    LDI r6, 0x2000    ; source ptr
    LDI r15, 0         ; entry index (0..7)

parse_line:
    ; Skip whitespace/newlines
skip_ws:
    LOAD r13, r6
    JZ r13, parse_done ; null = end
    LDI r12, 10
    CMP r13, r12
    JZ r5, advance_skip
    LDI r12, 13
    CMP r13, r12
    JZ r5, advance_skip
    LDI r12, 32
    CMP r13, r12
    JNZ r5, try_digit
advance_skip:
    LDI r12, 1
    ADD r6, r12
    JMP skip_ws

try_digit:
    ; Check if it's a digit (48-57)
    LDI r12, 48
    CMP r13, r12
    BLT r5, skip_line  ; < '0' -> skip line
    LDI r12, 58
    CMP r13, r12
    BGE r5, skip_line  ; > '9' -> skip line

    ; Parse decimal number into r1
    LDI r1, 0
    LDI r4, 10
parse_digit:
    ; r13 already loaded
    ; Check digit range
    LDI r16, 48
    CMP r13, r16
    BLT r5, got_interval
    LDI r16, 58
    CMP r13, r16
    BGE r5, got_interval

    ; r1 = r1 * 10 + (digit - 48)
    MUL r1, r4
    LDI r16, 48
    SUB r13, r16
    ADD r1, r13

    LDI r12, 1
    ADD r6, r12
    LOAD r13, r6
    JMP parse_digit

got_interval:
    ; Skip space after interval
    LDI r12, 32
    CMP r13, r12
    JNZ r5, skip_line  ; no space after interval = malformed
    LDI r12, 1
    ADD r6, r12       ; skip space

    ; Compute entry base
    LDI r4, 64
    MOV r16, r15
    MUL r16, r4
    LDI r17, 0x4000
    ADD r16, r17       ; r16 = entry base

    ; Store interval
    STORE r16, r1

    ; Store last_run = 0
    MOV r17, r16
    LDI r18, 1
    ADD r17, r18
    LDI r18, 0
    STORE r17, r18

    ; Copy name at offset 4
    MOV r17, r16
    LDI r18, 4
    ADD r17, r18       ; r17 = dest for name
    LDI r19, 0         ; name len

copy_name_char:
    LOAD r13, r6
    JZ r13, end_copy_name
    LDI r12, 10
    CMP r13, r12
    JZ r5, end_copy_name
    LDI r12, 13
    CMP r13, r12
    JZ r5, end_copy_name

    STORE r17, r13
    LDI r12, 1
    ADD r6, r12
    ADD r17, r12
    ADD r19, r12
    LDI r20, 56
    CMP r19, r20
    BGE r5, end_copy_name
    JMP copy_name_char

end_copy_name:
    ; Store name_len at offset 2
    MOV r17, r16
    LDI r18, 2
    ADD r17, r18
    STORE r17, r19

    ; Next entry
    LDI r12, 1
    ADD r15, r12
    LDI r12, 8
    CMP r15, r12
    BGE r5, parse_done

    ; Fall through to skip rest of line

skip_line:
    ; Skip to next newline or null
    LOAD r13, r6
    JZ r13, parse_done
    LDI r12, 10
    CMP r13, r12
    JZ r5, skip_newline
    LDI r12, 1
    ADD r6, r12
    JMP skip_line

skip_newline:
    LDI r12, 1
    ADD r6, r12
    JMP parse_line

parse_done:
    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; copy_name: Copy entry name to 0x5000 for EXEC
; Input: r13 = entry base, r16 clobbered
; ═══════════════════════════════════════════════════════════════
copy_name:
    PUSH r31

    ; Get name_len at offset 2
    MOV r16, r13
    LDI r17, 2
    ADD r16, r17
    LOAD r17, r16      ; r17 = name length

    ; Copy name from offset 4
    MOV r16, r13
    LDI r18, 4
    ADD r16, r18
    LDI r18, 0x5000
    LDI r19, 0

cpn_loop:
    CMP r19, r17
    BGE r5, cpn_done
    LOAD r20, r16
    STORE r18, r20
    LDI r20, 1
    ADD r16, r20
    ADD r18, r20
    ADD r19, r20
    JMP cpn_loop

cpn_done:
    LDI r20, 0
    STORE r18, r20

    POP r31
    RET
