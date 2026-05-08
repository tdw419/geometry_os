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
    LDI r1, 0
    FILL r1               ; clear screen to black

    ; Write boot banner to RAM
    LDI r15, 0x0300
    LDI r1, 71        ; G
    STORE r15, r1
    LDI r15, 0x0301
    LDI r1, 101       ; e
    STORE r15, r1
    LDI r15, 0x0302
    LDI r1, 111       ; o
    STORE r15, r1
    LDI r15, 0x0303
    LDI r1, 109       ; m
    STORE r15, r1
    LDI r15, 0x0304
    LDI r1, 101       ; e
    STORE r15, r1
    LDI r15, 0x0305
    LDI r1, 116       ; t
    STORE r15, r1
    LDI r15, 0x0306
    LDI r1, 114       ; r
    STORE r15, r1
    LDI r15, 0x0307
    LDI r1, 121       ; y
    STORE r15, r1
    LDI r15, 0x0308
    LDI r1, 32        ; (space)
    STORE r15, r1
    LDI r15, 0x0309
    LDI r1, 79        ; O
    STORE r15, r1
    LDI r15, 0x030A
    LDI r1, 83        ; S
    STORE r15, r1
    LDI r15, 0x030B
    LDI r1, 0         ; null terminator
    STORE r15, r1

    ; Display boot banner
    LDI r11, 2          ; x = 2
    LDI r0, 0          ; y = 0 (top of screen)
    LDI r10, 0x0300     ; banner string addr
    TEXT r11, r0, r10

    ; Write newline string
    LDI r15, 0x0400
    LDI r1, 10         ; \n
    STORE r15, r1
    LDI r15, 0x0401
    LDI r1, 0
    STORE r15, r1

    ; Write "init: " label
    LDI r15, 0x0500
    LDI r1, 105       ; i
    STORE r15, r1
    LDI r15, 0x0501
    LDI r1, 110       ; n
    STORE r15, r1
    LDI r15, 0x0502
    LDI r1, 105       ; i
    STORE r15, r1
    LDI r15, 0x0503
    LDI r1, 116       ; t
    STORE r15, r1
    LDI r15, 0x0504
    LDI r1, 58        ; :
    STORE r15, r1
    LDI r15, 0x0505
    LDI r1, 32        ; (space)
    STORE r15, r1
    LDI r15, 0x0506
    LDI r1, 0
    STORE r15, r1

    ; Display "init: " label at y=2
    LDI r11, 2
    LDI r0, 12
    LDI r10, 0x0500
    TEXT r11, r0, r10

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r15, 0x0200
    LDI r1, 115       ; s
    STORE r15, r1
    LDI r15, 0x0201
    LDI r1, 104       ; h
    STORE r15, r1
    LDI r15, 0x0202
    LDI r1, 101       ; e
    STORE r15, r1
    LDI r15, 0x0203
    LDI r1, 108       ; l
    STORE r15, r1
    LDI r15, 0x0204
    LDI r1, 108       ; l
    STORE r15, r1
    LDI r15, 0x0205
    LDI r1, 0         ; null terminator
    STORE r15, r1

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r1, 0x0200     ; shell name addr
    EXEC r1            ; spawn shell

    ; Check if spawn succeeded
    LDI r15, 0xFFA
    LOAD r12, r15        ; r12 = result PID
    LDI r11, 0xFFFFFFFF
    CMP r12, r11
    JZ r1, spawn_failed  ; if CMP result == 0 (r12 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r15, 0x0700
    STORE r15, r12

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r9, 60
    SLEEP r9          ; sleep 60 frames (~1 second) between checks
    LDI r15, 0x0700
    LOAD r1, r15        ; r1 = shell PID
    WAITPID r1         ; check if still running
    ; r1 = 0 means still running, 1 means exited
    JNZ r1, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
