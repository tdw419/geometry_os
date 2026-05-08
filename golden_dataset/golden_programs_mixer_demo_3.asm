; DESCRIPTION: A colored line centered at the screen with fixed size.

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
    LDI r1, mixer_daemon
    SPAWN r1
    LDI r1, 0xFFA
    LOAD r1, r1             ; r1 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r13, 0xF00
    STORE r13, r1           ; RAM[0xF00] = mixer PID
    LDI r7, melody_child
    SPAWN r7

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r15, 1               ; channel 1
    LDI r6, 131             ; C3
    LDI r11, 600
    LDI r0, 70
    MSGSND r1
    FRAME

    LDI r15, 1
    LDI r6, 196             ; G3
    LDI r11, 600
    LDI r0, 70
    MSGSND r1
    FRAME

    LDI r15, 1
    LDI r6, 220             ; A3
    LDI r11, 600
    LDI r0, 70
    MSGSND r1
    FRAME

    LDI r15, 1
    LDI r6, 175             ; F3
    LDI r11, 800
    LDI r0, 80
    MSGSND r1
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r1
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r1, 0xF00
    LOAD r1, r1             ; r1 = mixer PID

    ; Play melody on channel 0
    LDI r15, 0               ; channel 0
    LDI r6, 523             ; C5
    LDI r11, 300
    LDI r0, 90
    MSGSND r1
    FRAME

    LDI r15, 0
    LDI r6, 587             ; D5
    LDI r11, 300
    LDI r0, 90
    MSGSND r1
    FRAME

    LDI r15, 0
    LDI r6, 659             ; E5
    LDI r11, 300
    LDI r0, 90
    MSGSND r1
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r8, 1               ; constant 1
    LDI r5, 4               ; max channels
    LDI r3, 0x200           ; channel table base

    ; Initialize channel table
    LDI r13, 0
    LDI r10, 0x200
    LDI r14, 0x210
mix_init:
    STORE r10, r13
    ADD r10, r8
    CMP r10, r14
    BLT r9, mix_init

mixer_loop:
    MSGRCV                  ; r9=sender, r15=channel, r6=freq, r11=dur, r0=vol
    CMP r15, r5
    BGE r9, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r13, r15
    LDI r4, 4
    MUL r13, r4
    ADD r13, r3
    STORE r13, r6           ; freq
    MOV r4, r13
    ADD r4, r8
    STORE r4, r11           ; dur
    MOV r4, r13
    LDI r10, 2
    ADD r4, r10
    STORE r4, r0           ; vol
    MOV r4, r13
    LDI r10, 3
    ADD r4, r10
    STORE r4, r8           ; active = 1

    BEEP r6, r11
    FRAME
    JMP mixer_loop
