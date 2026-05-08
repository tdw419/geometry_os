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
    LDI r4, 0
    FILL r4               ; clear screen to black

    ; Write boot banner to RAM
    LDI r10, 0x0300
    LDI r4, 71        ; G
    STORE r10, r4
    LDI r10, 0x0301
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x0302
    LDI r4, 111       ; o
    STORE r10, r4
    LDI r10, 0x0303
    LDI r4, 109       ; m
    STORE r10, r4
    LDI r10, 0x0304
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x0305
    LDI r4, 116       ; t
    STORE r10, r4
    LDI r10, 0x0306
    LDI r4, 114       ; r
    STORE r10, r4
    LDI r10, 0x0307
    LDI r4, 121       ; y
    STORE r10, r4
    LDI r10, 0x0308
    LDI r4, 32        ; (space)
    STORE r10, r4
    LDI r10, 0x0309
    LDI r4, 79        ; O
    STORE r10, r4
    LDI r10, 0x030A
    LDI r4, 83        ; S
    STORE r10, r4
    LDI r10, 0x030B
    LDI r4, 0         ; null terminator
    STORE r10, r4

    ; Display boot banner
    LDI r2, 2          ; x = 2
    LDI r7, 0          ; y = 0 (top of screen)
    LDI r9, 0x0300     ; banner string addr
    TEXT r2, r7, r9

    ; Write newline string
    LDI r10, 0x0400
    LDI r4, 10         ; \n
    STORE r10, r4
    LDI r10, 0x0401
    LDI r4, 0
    STORE r10, r4

    ; Write "init: " label
    LDI r10, 0x0500
    LDI r4, 105       ; i
    STORE r10, r4
    LDI r10, 0x0501
    LDI r4, 110       ; n
    STORE r10, r4
    LDI r10, 0x0502
    LDI r4, 105       ; i
    STORE r10, r4
    LDI r10, 0x0503
    LDI r4, 116       ; t
    STORE r10, r4
    LDI r10, 0x0504
    LDI r4, 58        ; :
    STORE r10, r4
    LDI r10, 0x0505
    LDI r4, 32        ; (space)
    STORE r10, r4
    LDI r10, 0x0506
    LDI r4, 0
    STORE r10, r4

    ; Display "init: " label at y=2
    LDI r2, 2
    LDI r7, 12
    LDI r9, 0x0500
    TEXT r2, r7, r9

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r10, 0x0200
    LDI r4, 115       ; s
    STORE r10, r4
    LDI r10, 0x0201
    LDI r4, 104       ; h
    STORE r10, r4
    LDI r10, 0x0202
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x0203
    LDI r4, 108       ; l
    STORE r10, r4
    LDI r10, 0x0204
    LDI r4, 108       ; l
    STORE r10, r4
    LDI r10, 0x0205
    LDI r4, 0         ; null terminator
    STORE r10, r4

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r4, 0x0200     ; shell name addr
    EXEC r4            ; spawn shell

    ; Check if spawn succeeded
    LDI r10, 0xFFA
    LOAD r11, r10        ; r11 = result PID
    LDI r2, 0xFFFFFFFF
    CMP r11, r2
    JZ r4, spawn_failed  ; if CMP result == 0 (r11 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r10, 0x0700
    STORE r10, r11

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r5, 60
    SLEEP r5          ; sleep 60 frames (~1 second) between checks
    LDI r10, 0x0700
    LOAD r4, r10        ; r4 = shell PID
    WAITPID r4         ; check if still running
    ; r4 = 0 means still running, 1 means exited
    JNZ r4, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
