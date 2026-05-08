; DESCRIPTION: Draws a colored line at the screen with fixed size.

; mixer_demo.asm -- Multi-Channel Music Demo (Phase 99)
;
; Two processes send notes to a mixer daemon on different channels.
; Demonstrates multi-process IPC with concurrent audio.
;
; Architecture:
;   Parent --- MSGSND ---> Mixer (daemon) <--- MSGSND --- Child
;   Parent plays melody on channel 0
;   Child plays bass on channel 1
;
; The mixer receives notes from both processes and plays them.

    LDI r30, 0xFF00         ; SP

    ; ── Spawn mixer daemon ──
    LDI r11, mixer_daemon
    SPAWN r11
    LDI r11, 0xFFA
    LOAD r11, r11             ; r11 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r7, 0xF00
    STORE r7, r11           ; RAM[0xF00] = mixer PID
    LDI r8, melody_child
    SPAWN r8

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r12, 1               ; channel 1
    LDI r14, 131             ; C3
    LDI r2, 600
    LDI r15, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r14, 196             ; G3
    LDI r2, 600
    LDI r15, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r14, 220             ; A3
    LDI r2, 600
    LDI r15, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r14, 175             ; F3
    LDI r2, 800
    LDI r15, 80
    MSGSND r11
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r11
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r11, 0xF00
    LOAD r11, r11             ; r11 = mixer PID

    ; Play melody on channel 0
    LDI r12, 0               ; channel 0
    LDI r14, 523             ; C5
    LDI r2, 300
    LDI r15, 90
    MSGSND r11
    FRAME

    LDI r12, 0
    LDI r14, 587             ; D5
    LDI r2, 300
    LDI r15, 90
    MSGSND r11
    FRAME

    LDI r12, 0
    LDI r14, 659             ; E5
    LDI r2, 300
    LDI r15, 90
    MSGSND r11
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r9, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r10, 0x200           ; channel table base

    ; Initialize channel table
    LDI r7, 0
    LDI r4, 0x200
    LDI r0, 0x210
mix_init:
    STORE r4, r7
    ADD r4, r9
    CMP r4, r0
    BLT r6, mix_init

mixer_loop:
    MSGRCV                  ; r6=sender, r12=channel, r14=freq, r2=dur, r15=vol
    CMP r12, r3
    BGE r6, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r7, r12
    LDI r13, 4
    MUL r7, r13
    ADD r7, r10
    STORE r7, r14           ; freq
    MOV r13, r7
    ADD r13, r9
    STORE r13, r2           ; dur
    MOV r13, r7
    LDI r4, 2
    ADD r13, r4
    STORE r13, r15           ; vol
    MOV r13, r7
    LDI r4, 3
    ADD r13, r4
    STORE r13, r9           ; active = 1

    BEEP r14, r2
    FRAME
    JMP mixer_loop
