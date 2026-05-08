; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r11, 0
    FILL r11               ; clear screen to black

    ; Write boot banner to RAM
    LDI r14, 0x0300
    LDI r11, 71        ; G
    STORE r14, r11
    LDI r14, 0x0301
    LDI r11, 101       ; e
    STORE r14, r11
    LDI r14, 0x0302
    LDI r11, 111       ; o
    STORE r14, r11
    LDI r14, 0x0303
    LDI r11, 109       ; m
    STORE r14, r11
    LDI r14, 0x0304
    LDI r11, 101       ; e
    STORE r14, r11
    LDI r14, 0x0305
    LDI r11, 116       ; t
    STORE r14, r11
    LDI r14, 0x0306
    LDI r11, 114       ; r
    STORE r14, r11
    LDI r14, 0x0307
    LDI r11, 121       ; y
    STORE r14, r11
    LDI r14, 0x0308
    LDI r11, 32        ; (space)
    STORE r14, r11
    LDI r14, 0x0309
    LDI r11, 79        ; O
    STORE r14, r11
    LDI r14, 0x030A
    LDI r11, 83        ; S
    STORE r14, r11
    LDI r14, 0x030B
    LDI r11, 0         ; null terminator
    STORE r14, r11

    ; Display boot banner
    LDI r10, 2          ; x = 2
    LDI r4, 0          ; y = 0 (top of screen)
    LDI r5, 0x0300     ; banner string addr
    TEXT r10, r4, r5

    ; Write newline string
    LDI r14, 0x0400
    LDI r11, 10         ; \n
    STORE r14, r11
    LDI r14, 0x0401
    LDI r11, 0
    STORE r14, r11

    ; Write "init: " label
    LDI r14, 0x0500
    LDI r11, 105       ; i
    STORE r14, r11
    LDI r14, 0x0501
    LDI r11, 110       ; n
    STORE r14, r11
    LDI r14, 0x0502
    LDI r11, 105       ; i
    STORE r14, r11
    LDI r14, 0x0503
    LDI r11, 116       ; t
    STORE r14, r11
    LDI r14, 0x0504
    LDI r11, 58        ; :
    STORE r14, r11
    LDI r14, 0x0505
    LDI r11, 32        ; (space)
    STORE r14, r11
    LDI r14, 0x0506
    LDI r11, 0
    STORE r14, r11

    ; Display "init: " label at y=2
    LDI r10, 2
    LDI r4, 12
    LDI r5, 0x0500
    TEXT r10, r4, r5

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r14, 0x0200
    LDI r11, 115       ; s
    STORE r14, r11
    LDI r14, 0x0201
    LDI r11, 104       ; h
    STORE r14, r11
    LDI r14, 0x0202
    LDI r11, 101       ; e
    STORE r14, r11
    LDI r14, 0x0203
    LDI r11, 108       ; l
    STORE r14, r11
    LDI r14, 0x0204
    LDI r11, 108       ; l
    STORE r14, r11
    LDI r14, 0x0205
    LDI r11, 0         ; null terminator
    STORE r14, r11

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r11, 0x0200     ; shell name addr
    EXEC r11            ; spawn shell

    ; Check if spawn succeeded
    LDI r14, 0xFFA
    LOAD r0, r14        ; r0 = result PID
    LDI r10, 0xFFFFFFFF
    CMP r0, r10
    JZ r11, spawn_failed  ; if CMP result == 0 (r0 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r14, 0x0700
    STORE r14, r0

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r13, 60
    SLEEP r13          ; sleep 60 frames (~1 second) between checks
    LDI r14, 0x0700
    LOAD r11, r14        ; r11 = shell PID
    WAITPID r11         ; check if still running
    ; r11 = 0 means still running, 1 means exited
    JNZ r11, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
