; DESCRIPTION: This GeOS assembly code demonstrates a multi-process interprocess communication (IPC) system for concurrent audio playback. It spawns a mixer daemon and two child processes: one for playing a melody on channel 0 and another for playing a bass line on channel 1. The mixer receives notes from both processes, stores them in a channel table, and plays the sounds using the `BEEP` instruction.

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
    LDI r13, 0xF00
    STORE r13, r12           ; RAM[0xF00] = mixer PID
    LDI r4, melody_child
    SPAWN r4

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r8, 1               ; channel 1
    LDI r6, 131             ; C3
    LDI r0, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r8, 1
    LDI r6, 196             ; G3
    LDI r0, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r8, 1
    LDI r6, 220             ; A3
    LDI r0, 600
    LDI r14, 70
    MSGSND r12
    FRAME

    LDI r8, 1
    LDI r6, 175             ; F3
    LDI r0, 800
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
    LDI r8, 0               ; channel 0
    LDI r6, 523             ; C5
    LDI r0, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    LDI r8, 0
    LDI r6, 587             ; D5
    LDI r0, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    LDI r8, 0
    LDI r6, 659             ; E5
    LDI r0, 300
    LDI r14, 90
    MSGSND r12
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r3, 1               ; constant 1
    LDI r1, 4               ; max channels
    LDI r2, 0x200           ; channel table base

    ; Initialize channel table
    LDI r13, 0
    LDI r11, 0x200
    LDI r15, 0x210
mix_init:
    STORE r11, r13
    ADD r11, r3
    CMP r11, r15
    BLT r7, mix_init

mixer_loop:
    MSGRCV                  ; r7=sender, r8=channel, r6=freq, r0=dur, r14=vol
    CMP r8, r1
    BGE r7, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r13, r8
    LDI r10, 4
    MUL r13, r10
    ADD r13, r2
    STORE r13, r6           ; freq
    MOV r10, r13
    ADD r10, r3
    STORE r10, r0           ; dur
    MOV r10, r13
    LDI r11, 2
    ADD r10, r11
    STORE r10, r14           ; vol
    MOV r10, r13
    LDI r11, 3
    ADD r10, r11
    STORE r10, r3           ; active = 1

    BEEP r6, r0
    FRAME
    JMP mixer_loop
