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
    LDI r12, mixer_daemon
    SPAWN r12
    LDI r12, 0xFFA
    LOAD r12, r12             ; r12 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r5, 0xF00
    STORE r5, r12           ; RAM[0xF00] = mixer PID
    LDI r13, melody_child
    SPAWN r13

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r11, 1               ; channel 1
    LDI r7, 131             ; C3
    LDI r8, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r11, 1
    LDI r7, 196             ; G3
    LDI r8, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r11, 1
    LDI r7, 220             ; A3
    LDI r8, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r11, 1
    LDI r7, 175             ; F3
    LDI r8, 800
    LDI r14, 80
    MSGSND r12
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r12
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r12, 0xF00
    LOAD r12, r12             ; r12 = mixer PID

    ; Play melody on channel 0
    LDI r11, 0               ; channel 0
    LDI r7, 523             ; C5
    LDI r8, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    LDI r11, 0
    LDI r7, 587             ; D5
    LDI r8, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    LDI r11, 0
    LDI r7, 659             ; E5
    LDI r8, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r9, 1               ; constant 1
    LDI r0, 4               ; max channels
    LDI r10, 0x200           ; channel table base

    ; Initialize channel table
    LDI r5, 0
    LDI r6, 0x200
    LDI r1, 0x210
mix_init:
    STORE r6, r5
    ADD r6, r9
    CMP r6, r1
    BLT r2, mix_init

mixer_loop:
    MSGRCV                  ; r2=sender, r11=channel, r7=freq, r8=dur, r14=vol
    CMP r11, r0
    BGE r2, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r5, r11
    LDI r15, 4
    MUL r5, r15
    ADD r5, r10
    STORE r5, r7           ; freq
    MOV r15, r5
    ADD r15, r9
    STORE r15, r8           ; dur
    MOV r15, r5
    LDI r6, 2
    ADD r15, r6
    STORE r15, r14           ; vol
    MOV r15, r5
    LDI r6, 3
    ADD r15, r6
    STORE r15, r9           ; active = 1

    BEEP r7, r8
    FRAME
    JMP mixer_loop
