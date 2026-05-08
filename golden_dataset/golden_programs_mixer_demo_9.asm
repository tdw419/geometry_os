; DESCRIPTION: Geometry OS program to draw a colored line.

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
    LDI r14, mixer_daemon
    SPAWN r14
    LDI r14, 0xFFA
    LOAD r14, r14             ; r14 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r7, 0xF00
    STORE r7, r14           ; RAM[0xF00] = mixer PID
    LDI r12, melody_child
    SPAWN r12

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r15, 1               ; channel 1
    LDI r13, 131             ; C3
    LDI r9, 600
    LDI r6, 70
    MSGSND r14
    FRAME

    LDI r15, 1
    LDI r13, 196             ; G3
    LDI r9, 600
    LDI r6, 70
    MSGSND r14
    FRAME

    LDI r15, 1
    LDI r13, 220             ; A3
    LDI r9, 600
    LDI r6, 70
    MSGSND r14
    FRAME

    LDI r15, 1
    LDI r13, 175             ; F3
    LDI r9, 800
    LDI r6, 80
    MSGSND r14
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r14
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r14, 0xF00
    LOAD r14, r14             ; r14 = mixer PID

    ; Play melody on channel 0
    LDI r15, 0               ; channel 0
    LDI r13, 523             ; C5
    LDI r9, 300
    LDI r6, 90
    MSGSND r14
    FRAME

    LDI r15, 0
    LDI r13, 587             ; D5
    LDI r9, 300
    LDI r6, 90
    MSGSND r14
    FRAME

    LDI r15, 0
    LDI r13, 659             ; E5
    LDI r9, 300
    LDI r6, 90
    MSGSND r14
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r4, 1               ; constant 1
    LDI r1, 4               ; max channels
    LDI r11, 0x200           ; channel table base

    ; Initialize channel table
    LDI r7, 0
    LDI r5, 0x200
    LDI r0, 0x210
mix_init:
    STORE r5, r7
    ADD r5, r4
    CMP r5, r0
    BLT r8, mix_init

mixer_loop:
    MSGRCV                  ; r8=sender, r15=channel, r13=freq, r9=dur, r6=vol
    CMP r15, r1
    BGE r8, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r7, r15
    LDI r10, 4
    MUL r7, r10
    ADD r7, r11
    STORE r7, r13           ; freq
    MOV r10, r7
    ADD r10, r4
    STORE r10, r9           ; dur
    MOV r10, r7
    LDI r5, 2
    ADD r10, r5
    STORE r10, r6           ; vol
    MOV r10, r7
    LDI r5, 3
    ADD r10, r5
    STORE r10, r4           ; active = 1

    BEEP r13, r9
    FRAME
    JMP mixer_loop
