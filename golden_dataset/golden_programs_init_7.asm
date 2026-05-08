; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
    LDI r7, 0
    FILL r7               ; clear screen to black

    ; Write boot banner to RAM
    LDI r9, 0x0300
    LDI r7, 71        ; G
    STORE r9, r7
    LDI r9, 0x0301
    LDI r7, 101       ; e
    STORE r9, r7
    LDI r9, 0x0302
    LDI r7, 111       ; o
    STORE r9, r7
    LDI r9, 0x0303
    LDI r7, 109       ; m
    STORE r9, r7
    LDI r9, 0x0304
    LDI r7, 101       ; e
    STORE r9, r7
    LDI r9, 0x0305
    LDI r7, 116       ; t
    STORE r9, r7
    LDI r9, 0x0306
    LDI r7, 114       ; r
    STORE r9, r7
    LDI r9, 0x0307
    LDI r7, 121       ; y
    STORE r9, r7
    LDI r9, 0x0308
    LDI r7, 32        ; (space)
    STORE r9, r7
    LDI r9, 0x0309
    LDI r7, 79        ; O
    STORE r9, r7
    LDI r9, 0x030A
    LDI r7, 83        ; S
    STORE r9, r7
    LDI r9, 0x030B
    LDI r7, 0         ; null terminator
    STORE r9, r7

    ; Display boot banner
    LDI r15, 2          ; x = 2
    LDI r11, 0          ; y = 0 (top of screen)
    LDI r14, 0x0300     ; banner string addr
    TEXT r15, r11, r14

    ; Write newline string
    LDI r9, 0x0400
    LDI r7, 10         ; \n
    STORE r9, r7
    LDI r9, 0x0401
    LDI r7, 0
    STORE r9, r7

    ; Write "init: " label
    LDI r9, 0x0500
    LDI r7, 105       ; i
    STORE r9, r7
    LDI r9, 0x0501
    LDI r7, 110       ; n
    STORE r9, r7
    LDI r9, 0x0502
    LDI r7, 105       ; i
    STORE r9, r7
    LDI r9, 0x0503
    LDI r7, 116       ; t
    STORE r9, r7
    LDI r9, 0x0504
    LDI r7, 58        ; :
    STORE r9, r7
    LDI r9, 0x0505
    LDI r7, 32        ; (space)
    STORE r9, r7
    LDI r9, 0x0506
    LDI r7, 0
    STORE r9, r7

    ; Display "init: " label at y=2
    LDI r15, 2
    LDI r11, 12
    LDI r14, 0x0500
    TEXT r15, r11, r14

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Write shell program name to RAM
    ; ═══════════════════════════════════════════════════════════════
    LDI r9, 0x0200
    LDI r7, 115       ; s
    STORE r9, r7
    LDI r9, 0x0201
    LDI r7, 104       ; h
    STORE r9, r7
    LDI r9, 0x0202
    LDI r7, 101       ; e
    STORE r9, r7
    LDI r9, 0x0203
    LDI r7, 108       ; l
    STORE r9, r7
    LDI r9, 0x0204
    LDI r7, 108       ; l
    STORE r9, r7
    LDI r9, 0x0205
    LDI r7, 0         ; null terminator
    STORE r9, r7

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Spawn shell process
    ; ═══════════════════════════════════════════════════════════════
spawn_shell:
    LDI r7, 0x0200     ; shell name addr
    EXEC r7            ; spawn shell

    ; Check if spawn succeeded
    LDI r9, 0xFFA
    LOAD r2, r9        ; r2 = result PID
    LDI r15, 0xFFFFFFFF
    CMP r2, r15
    JZ r7, spawn_failed  ; if CMP result == 0 (r2 == 0xFFFFFFFF), spawn failed

    ; Store shell PID
    LDI r9, 0x0700
    STORE r9, r2

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 4: Supervisor loop -- wait for shell to exit, respawn
    ; ═══════════════════════════════════════════════════════════════
supervisor_loop:
    LDI r0, 60
    SLEEP r0          ; sleep 60 frames (~1 second) between checks
    LDI r9, 0x0700
    LOAD r7, r9        ; r7 = shell PID
    WAITPID r7         ; check if still running
    ; r7 = 0 means still running, 1 means exited
    JNZ r7, shell_died ; shell exited, respawn
    JMP supervisor_loop ; still running, keep monitoring

spawn_failed:
    ; If spawn failed, just halt. In a real OS this would panic.
    HALT

shell_died:
    ; Shell died, respawn it
    JMP spawn_shell
