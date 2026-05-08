; DESCRIPTION: This GeOS assembly code initializes the system by clearing the screen, displaying the boot banner "Geometry OS v1.0.0", and writing the string "init: " to the screen. It then spawns a shell process named "shell" and enters a supervisor loop where it monitors the shell's status; if the shell exits, it respawns it. If spawning the shell fails, the system halts.

; init.asm -- Phase 30: Init process (PID 1)
;
; The first user process. Started by the boot ROM.
; Reads boot.cfg, spawns the shell and any configured services.
; If the shell dies, respawns it (supervisor pattern).
;
; Memory layout:
;   0x0200: shell program name string ("shell")
;   0x0300: boot banner string ("Geometry OS v1.0.0")
;   0x0400: newline string
;   0x0500: init label string ("init: ")
;   0x0600: status message buffer
;   0x0700: shell PID storage

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Phase 1: Initialize -- clear screen, display boot banner
; ═══════════════════════════════════════════════════════════════
    LDI r10, 0
    FILL r10               ; clear screen to black

    ; Write boot banner to RAM
    LDI r9, 0x0300
    LDI r10, 71        ; G
    STORE r9, r10
    LDI r9, 0x0301
    LDI r10, 101       ; e
    STORE r9, r10
    LDI r9, 0x0302
    LDI r10, 111       ; o
    STORE r9, r10
    LDI r9, 0x0303
    LDI r10, 109       ; m
    STORE r9, r10
    LDI r9, 0x0304
    LDI r10, 101       ; e
    STORE r9, r10
    LDI r9, 0x0305
    LDI r10, 116       ; t
    STORE r9, r10
    LDI r9, 0x0306
    LDI r10, 114       ; r
    STORE r9, r10
    LDI r9, 0x0307
    LDI r10, 121       ; y
    STORE r9, r10
    LDI r9, 0x0308
    LDI r10, 32        ; (space)
    STORE r9, r10
    LDI r9, 0x0309
    LDI r10, 79        ; O
    STORE r9, r10
    LDI r9, 0x030A
    LDI r10, 83        ; S
    STORE r9, r10
    LDI r9, 0x030B
    LDI r10, 0         ; null terminator
    STORE r9, r10

    ; Display boot banner
    LDI r2, 2          ; x = 2
    LDI r15, 0          ; y = 0 (top of screen)
    LDI r0, 0x0300     ; banner string addr
    TEXT r2, r15, r0

    ; Write newline string
    LDI r9, 0x0400
    LDI r10, 10         ; \n
    STORE r9, r10
    LDI r9, 0x0401
    LDI r10, 0
    STORE r9, r10

    ; Write "init: " label
    LDI r9, 0x0500
    LDI r10, 105       ; i
    STORE r9, r10
    LDI r9, 0x0501
    LDI r10, 110       ; n
    STORE r9, r10
    LDI r9, 0x0502
    LDI r10, 105       ; i
    STORE r9, r10
    LDI r9, 0x0503
    LDI r10, 116       ; t
    STORE r9, r10
    LDI r9, 0x0504
    LDI r10, 58        ; :
    STORE r9, r10
    LDI r9, 0x0505
    LDI r10, 32        ; (space)
    STORE r9, r10
    LDI r9, 0x0506
    LDI r10, 0
    STORE r9, r10

    ; Display "init: " label at y=2
    LDI r2, 2
    LDI r15, 12
    LDI r0, 0x0500
    TEXT r2, r15, r0

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r9, 0x0200
    LDI r10, 115       ; s
    STORE r9, r10
    LDI r9, 0x0201
    LDI r10, 104       ; h
    STORE r9, r10
    LDI r9, 0x0202
    LDI r10, 101       ; e
    STORE r9, r10
    LDI r9, 0x0203
    LDI r10, 108       ; l
    STORE r9, r10
    LDI r9, 0x0204
    LDI r10, 108       ; l
    STORE r9, r10
    LDI r9, 0x0205
    LDI r10, 0         ; null terminator
    STORE r9, r10

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r10, 0x0200     ; shell name addr
    EXEC r10            ; spawn shell

    ; Check if spawn succeeded
    LDI r9, 0xFFA
    LOAD r6, r9        ; r6 = result PID
    LDI r2, 0xFFFFFFFF
    CMP r6, r2
    JZ r10, spawn_failed  ; if CMP result == 0 (r6 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r9, 0x0700
    STORE r9, r6

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r11, 60
    SLEEP r11          ; sleep 60 frames (~1 second) between checks
    LDI r9, 0x0700
    LOAD r10, r9        ; r10 = shell PID
    WAITPID r10         ; check if still running
    ; r10 = 0 means still running, 1 means exited
    JNZ r10, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
