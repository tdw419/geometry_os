; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r12, 0
    FILL r12               ; clear screen to black

    ; Write boot banner to RAM
    LDI r4, 0x0300
    LDI r12, 71        ; G
    STORE r4, r12
    LDI r4, 0x0301
    LDI r12, 101       ; e
    STORE r4, r12
    LDI r4, 0x0302
    LDI r12, 111       ; o
    STORE r4, r12
    LDI r4, 0x0303
    LDI r12, 109       ; m
    STORE r4, r12
    LDI r4, 0x0304
    LDI r12, 101       ; e
    STORE r4, r12
    LDI r4, 0x0305
    LDI r12, 116       ; t
    STORE r4, r12
    LDI r4, 0x0306
    LDI r12, 114       ; r
    STORE r4, r12
    LDI r4, 0x0307
    LDI r12, 121       ; y
    STORE r4, r12
    LDI r4, 0x0308
    LDI r12, 32        ; (space)
    STORE r4, r12
    LDI r4, 0x0309
    LDI r12, 79        ; O
    STORE r4, r12
    LDI r4, 0x030A
    LDI r12, 83        ; S
    STORE r4, r12
    LDI r4, 0x030B
    LDI r12, 0         ; null terminator
    STORE r4, r12

    ; Display boot banner
    LDI r3, 2          ; x = 2
    LDI r1, 0          ; y = 0 (top of screen)
    LDI r8, 0x0300     ; banner string addr
    TEXT r3, r1, r8

    ; Write newline string
    LDI r4, 0x0400
    LDI r12, 10         ; \n
    STORE r4, r12
    LDI r4, 0x0401
    LDI r12, 0
    STORE r4, r12

    ; Write "init: " label
    LDI r4, 0x0500
    LDI r12, 105       ; i
    STORE r4, r12
    LDI r4, 0x0501
    LDI r12, 110       ; n
    STORE r4, r12
    LDI r4, 0x0502
    LDI r12, 105       ; i
    STORE r4, r12
    LDI r4, 0x0503
    LDI r12, 116       ; t
    STORE r4, r12
    LDI r4, 0x0504
    LDI r12, 58        ; :
    STORE r4, r12
    LDI r4, 0x0505
    LDI r12, 32        ; (space)
    STORE r4, r12
    LDI r4, 0x0506
    LDI r12, 0
    STORE r4, r12

    ; Display "init: " label at y=2
    LDI r3, 2
    LDI r1, 12
    LDI r8, 0x0500
    TEXT r3, r1, r8

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r4, 0x0200
    LDI r12, 115       ; s
    STORE r4, r12
    LDI r4, 0x0201
    LDI r12, 104       ; h
    STORE r4, r12
    LDI r4, 0x0202
    LDI r12, 101       ; e
    STORE r4, r12
    LDI r4, 0x0203
    LDI r12, 108       ; l
    STORE r4, r12
    LDI r4, 0x0204
    LDI r12, 108       ; l
    STORE r4, r12
    LDI r4, 0x0205
    LDI r12, 0         ; null terminator
    STORE r4, r12

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r12, 0x0200     ; shell name addr
    EXEC r12            ; spawn shell

    ; Check if spawn succeeded
    LDI r4, 0xFFA
    LOAD r6, r4        ; r6 = result PID
    LDI r3, 0xFFFFFFFF
    CMP r6, r3
    JZ r12, spawn_failed  ; if CMP result == 0 (r6 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r4, 0x0700
    STORE r4, r6

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r11, 60
    SLEEP r11          ; sleep 60 frames (~1 second) between checks
    LDI r4, 0x0700
    LOAD r12, r4        ; r12 = shell PID
    WAITPID r12         ; check if still running
    ; r12 = 0 means still running, 1 means exited
    JNZ r12, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
