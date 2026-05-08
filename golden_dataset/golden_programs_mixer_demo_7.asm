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
    LDI r2, mixer_daemon
    SPAWN r2
    LDI r2, 0xFFA
    LOAD r2, r2             ; r2 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r0, 0xF00
    STORE r0, r2           ; RAM[0xF00] = mixer PID
    LDI r1, melody_child
    SPAWN r1

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r11, 1               ; channel 1
    LDI r15, 131             ; C3
    LDI r5, 600
    LDI r10, 70
    MSGSND r2
    FRAME

    LDI r11, 1
    LDI r15, 196             ; G3
    LDI r5, 600
    LDI r10, 70
    MSGSND r2
    FRAME

    LDI r11, 1
    LDI r15, 220             ; A3
    LDI r5, 600
    LDI r10, 70
    MSGSND r2
    FRAME

    LDI r11, 1
    LDI r15, 175             ; F3
    LDI r5, 800
    LDI r10, 80
    MSGSND r2
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r2
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r2, 0xF00
    LOAD r2, r2             ; r2 = mixer PID

    ; Play melody on channel 0
    LDI r11, 0               ; channel 0
    LDI r15, 523             ; C5
    LDI r5, 300
    LDI r10, 90
    MSGSND r2
    FRAME

    LDI r11, 0
    LDI r15, 587             ; D5
    LDI r5, 300
    LDI r10, 90
    MSGSND r2
    FRAME

    LDI r11, 0
    LDI r15, 659             ; E5
    LDI r5, 300
    LDI r10, 90
    MSGSND r2
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r8, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r14, 0x200           ; channel table base

    ; Initialize channel table
    LDI r0, 0
    LDI r13, 0x200
    LDI r7, 0x210
mix_init:
    STORE r13, r0
    ADD r13, r8
    CMP r13, r7
    BLT r4, mix_init

mixer_loop:
    MSGRCV                  ; r4=sender, r11=channel, r15=freq, r5=dur, r10=vol
    CMP r11, r3
    BGE r4, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r0, r11
    LDI r12, 4
    MUL r0, r12
    ADD r0, r14
    STORE r0, r15           ; freq
    MOV r12, r0
    ADD r12, r8
    STORE r12, r5           ; dur
    MOV r12, r0
    LDI r13, 2
    ADD r12, r13
    STORE r12, r10           ; vol
    MOV r12, r0
    LDI r13, 3
    ADD r12, r13
    STORE r12, r8           ; active = 1

    BEEP r15, r5
    FRAME
    JMP mixer_loop
