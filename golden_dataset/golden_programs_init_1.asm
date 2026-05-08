; DESCRIPTION: Display a object using color colored at the screen.

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
    LDI r9, 0x0300
    LDI r4, 71        ; G
    STORE r9, r4
    LDI r9, 0x0301
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x0302
    LDI r4, 111       ; o
    STORE r9, r4
    LDI r9, 0x0303
    LDI r4, 109       ; m
    STORE r9, r4
    LDI r9, 0x0304
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x0305
    LDI r4, 116       ; t
    STORE r9, r4
    LDI r9, 0x0306
    LDI r4, 114       ; r
    STORE r9, r4
    LDI r9, 0x0307
    LDI r4, 121       ; y
    STORE r9, r4
    LDI r9, 0x0308
    LDI r4, 32        ; (space)
    STORE r9, r4
    LDI r9, 0x0309
    LDI r4, 79        ; O
    STORE r9, r4
    LDI r9, 0x030A
    LDI r4, 83        ; S
    STORE r9, r4
    LDI r9, 0x030B
    LDI r4, 0         ; null terminator
    STORE r9, r4

    ; Display boot banner
    LDI r13, 2          ; x = 2
    LDI r1, 0          ; y = 0 (top of screen)
    LDI r11, 0x0300     ; banner string addr
    TEXT r13, r1, r11

    ; Write newline string
    LDI r9, 0x0400
    LDI r4, 10         ; \n
    STORE r9, r4
    LDI r9, 0x0401
    LDI r4, 0
    STORE r9, r4

    ; Write "init: " label
    LDI r9, 0x0500
    LDI r4, 105       ; i
    STORE r9, r4
    LDI r9, 0x0501
    LDI r4, 110       ; n
    STORE r9, r4
    LDI r9, 0x0502
    LDI r4, 105       ; i
    STORE r9, r4
    LDI r9, 0x0503
    LDI r4, 116       ; t
    STORE r9, r4
    LDI r9, 0x0504
    LDI r4, 58        ; :
    STORE r9, r4
    LDI r9, 0x0505
    LDI r4, 32        ; (space)
    STORE r9, r4
    LDI r9, 0x0506
    LDI r4, 0
    STORE r9, r4

    ; Display "init: " label at y=2
    LDI r13, 2
    LDI r1, 12
    LDI r11, 0x0500
    TEXT r13, r1, r11

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r9, 0x0200
    LDI r4, 115       ; s
    STORE r9, r4
    LDI r9, 0x0201
    LDI r4, 104       ; h
    STORE r9, r4
    LDI r9, 0x0202
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x0203
    LDI r4, 108       ; l
    STORE r9, r4
    LDI r9, 0x0204
    LDI r4, 108       ; l
    STORE r9, r4
    LDI r9, 0x0205
    LDI r4, 0         ; null terminator
    STORE r9, r4

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r4, 0x0200     ; shell name addr
    EXEC r4            ; spawn shell

    ; Check if spawn succeeded
    LDI r9, 0xFFA
    LOAD r7, r9        ; r7 = result PID
    LDI r13, 0xFFFFFFFF
    CMP r7, r13
    JZ r4, spawn_failed  ; if CMP result == 0 (r7 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r9, 0x0700
    STORE r9, r7

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r2, 60
    SLEEP r2          ; sleep 60 frames (~1 second) between checks
    LDI r9, 0x0700
    LOAD r4, r9        ; r4 = shell PID
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
