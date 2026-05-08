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
    LDI r9, 0
    FILL r9               ; clear screen to black

    ; Write boot banner to RAM
    LDI r2, 0x0300
    LDI r9, 71        ; G
    STORE r2, r9
    LDI r2, 0x0301
    LDI r9, 101       ; e
    STORE r2, r9
    LDI r2, 0x0302
    LDI r9, 111       ; o
    STORE r2, r9
    LDI r2, 0x0303
    LDI r9, 109       ; m
    STORE r2, r9
    LDI r2, 0x0304
    LDI r9, 101       ; e
    STORE r2, r9
    LDI r2, 0x0305
    LDI r9, 116       ; t
    STORE r2, r9
    LDI r2, 0x0306
    LDI r9, 114       ; r
    STORE r2, r9
    LDI r2, 0x0307
    LDI r9, 121       ; y
    STORE r2, r9
    LDI r2, 0x0308
    LDI r9, 32        ; (space)
    STORE r2, r9
    LDI r2, 0x0309
    LDI r9, 79        ; O
    STORE r2, r9
    LDI r2, 0x030A
    LDI r9, 83        ; S
    STORE r2, r9
    LDI r2, 0x030B
    LDI r9, 0         ; null terminator
    STORE r2, r9

    ; Display boot banner
    LDI r13, 2          ; x = 2
    LDI r15, 0          ; y = 0 (top of screen)
    LDI r7, 0x0300     ; banner string addr
    TEXT r13, r15, r7

    ; Write newline string
    LDI r2, 0x0400
    LDI r9, 10         ; \n
    STORE r2, r9
    LDI r2, 0x0401
    LDI r9, 0
    STORE r2, r9

    ; Write "init: " label
    LDI r2, 0x0500
    LDI r9, 105       ; i
    STORE r2, r9
    LDI r2, 0x0501
    LDI r9, 110       ; n
    STORE r2, r9
    LDI r2, 0x0502
    LDI r9, 105       ; i
    STORE r2, r9
    LDI r2, 0x0503
    LDI r9, 116       ; t
    STORE r2, r9
    LDI r2, 0x0504
    LDI r9, 58        ; :
    STORE r2, r9
    LDI r2, 0x0505
    LDI r9, 32        ; (space)
    STORE r2, r9
    LDI r2, 0x0506
    LDI r9, 0
    STORE r2, r9

    ; Display "init: " label at y=2
    LDI r13, 2
    LDI r15, 12
    LDI r7, 0x0500
    TEXT r13, r15, r7

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r2, 0x0200
    LDI r9, 115       ; s
    STORE r2, r9
    LDI r2, 0x0201
    LDI r9, 104       ; h
    STORE r2, r9
    LDI r2, 0x0202
    LDI r9, 101       ; e
    STORE r2, r9
    LDI r2, 0x0203
    LDI r9, 108       ; l
    STORE r2, r9
    LDI r2, 0x0204
    LDI r9, 108       ; l
    STORE r2, r9
    LDI r2, 0x0205
    LDI r9, 0         ; null terminator
    STORE r2, r9

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r9, 0x0200     ; shell name addr
    EXEC r9            ; spawn shell

    ; Check if spawn succeeded
    LDI r2, 0xFFA
    LOAD r11, r2        ; r11 = result PID
    LDI r13, 0xFFFFFFFF
    CMP r11, r13
    JZ r9, spawn_failed  ; if CMP result == 0 (r11 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r2, 0x0700
    STORE r2, r11

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r10, 60
    SLEEP r10          ; sleep 60 frames (~1 second) between checks
    LDI r2, 0x0700
    LOAD r9, r2        ; r9 = shell PID
    WAITPID r9         ; check if still running
    ; r9 = 0 means still running, 1 means exited
    JNZ r9, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
