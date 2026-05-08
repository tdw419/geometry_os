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
    LDI r5, 0
    FILL r5               ; clear screen to black

    ; Write boot banner to RAM
    LDI r9, 0x0300
    LDI r5, 71        ; G
    STORE r9, r5
    LDI r9, 0x0301
    LDI r5, 101       ; e
    STORE r9, r5
    LDI r9, 0x0302
    LDI r5, 111       ; o
    STORE r9, r5
    LDI r9, 0x0303
    LDI r5, 109       ; m
    STORE r9, r5
    LDI r9, 0x0304
    LDI r5, 101       ; e
    STORE r9, r5
    LDI r9, 0x0305
    LDI r5, 116       ; t
    STORE r9, r5
    LDI r9, 0x0306
    LDI r5, 114       ; r
    STORE r9, r5
    LDI r9, 0x0307
    LDI r5, 121       ; y
    STORE r9, r5
    LDI r9, 0x0308
    LDI r5, 32        ; (space)
    STORE r9, r5
    LDI r9, 0x0309
    LDI r5, 79        ; O
    STORE r9, r5
    LDI r9, 0x030A
    LDI r5, 83        ; S
    STORE r9, r5
    LDI r9, 0x030B
    LDI r5, 0         ; null terminator
    STORE r9, r5

    ; Display boot banner
    LDI r2, 2          ; x = 2
    LDI r14, 0          ; y = 0 (top of screen)
    LDI r13, 0x0300     ; banner string addr
    TEXT r2, r14, r13

    ; Write newline string
    LDI r9, 0x0400
    LDI r5, 10         ; \n
    STORE r9, r5
    LDI r9, 0x0401
    LDI r5, 0
    STORE r9, r5

    ; Write "init: " label
    LDI r9, 0x0500
    LDI r5, 105       ; i
    STORE r9, r5
    LDI r9, 0x0501
    LDI r5, 110       ; n
    STORE r9, r5
    LDI r9, 0x0502
    LDI r5, 105       ; i
    STORE r9, r5
    LDI r9, 0x0503
    LDI r5, 116       ; t
    STORE r9, r5
    LDI r9, 0x0504
    LDI r5, 58        ; :
    STORE r9, r5
    LDI r9, 0x0505
    LDI r5, 32        ; (space)
    STORE r9, r5
    LDI r9, 0x0506
    LDI r5, 0
    STORE r9, r5

    ; Display "init: " label at y=2
    LDI r2, 2
    LDI r14, 12
    LDI r13, 0x0500
    TEXT r2, r14, r13

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r9, 0x0200
    LDI r5, 115       ; s
    STORE r9, r5
    LDI r9, 0x0201
    LDI r5, 104       ; h
    STORE r9, r5
    LDI r9, 0x0202
    LDI r5, 101       ; e
    STORE r9, r5
    LDI r9, 0x0203
    LDI r5, 108       ; l
    STORE r9, r5
    LDI r9, 0x0204
    LDI r5, 108       ; l
    STORE r9, r5
    LDI r9, 0x0205
    LDI r5, 0         ; null terminator
    STORE r9, r5

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r5, 0x0200     ; shell name addr
    EXEC r5            ; spawn shell

    ; Check if spawn succeeded
    LDI r9, 0xFFA
    LOAD r6, r9        ; r6 = result PID
    LDI r2, 0xFFFFFFFF
    CMP r6, r2
    JZ r5, spawn_failed  ; if CMP result == 0 (r6 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r9, 0x0700
    STORE r9, r6

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r4, 60
    SLEEP r4          ; sleep 60 frames (~1 second) between checks
    LDI r9, 0x0700
    LOAD r5, r9        ; r5 = shell PID
    WAITPID r5         ; check if still running
    ; r5 = 0 means still running, 1 means exited
    JNZ r5, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
