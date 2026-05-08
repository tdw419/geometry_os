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
    LDI r1, mixer_daemon
    SPAWN r1
    LDI r1, 0xFFA
    LOAD r1, r1             ; r1 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r9, 0xF00
    STORE r9, r1           ; RAM[0xF00] = mixer PID
    LDI r7, melody_child
    SPAWN r7

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r3, 1               ; channel 1
    LDI r12, 131             ; C3
    LDI r0, 600
    LDI r14, 70
    MSGSND r1
    FRAME

    LDI r3, 1
    LDI r12, 196             ; G3
    LDI r0, 600
    LDI r14, 70
    MSGSND r1
    FRAME

    LDI r3, 1
    LDI r12, 220             ; A3
    LDI r0, 600
    LDI r14, 70
    MSGSND r1
    FRAME

    LDI r3, 1
    LDI r12, 175             ; F3
    LDI r0, 800
    LDI r14, 80
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
    LDI r3, 0               ; channel 0
    LDI r12, 523             ; C5
    LDI r0, 300
    LDI r14, 90
    MSGSND r1
    FRAME

    LDI r3, 0
    LDI r12, 587             ; D5
    LDI r0, 300
    LDI r14, 90
    MSGSND r1
    FRAME

    LDI r3, 0
    LDI r12, 659             ; E5
    LDI r0, 300
    LDI r14, 90
    MSGSND r1
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r4, 1               ; constant 1
    LDI r13, 4               ; max channels
    LDI r5, 0x200           ; channel table base

    ; Initialize channel table
    LDI r9, 0
    LDI r15, 0x200
    LDI r6, 0x210
mix_init:
    STORE r15, r9
    ADD r15, r4
    CMP r15, r6
    BLT r2, mix_init

mixer_loop:
    MSGRCV                  ; r2=sender, r3=channel, r12=freq, r0=dur, r14=vol
    CMP r3, r13
    BGE r2, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r9, r3
    LDI r10, 4
    MUL r9, r10
    ADD r9, r5
    STORE r9, r12           ; freq
    MOV r10, r9
    ADD r10, r4
    STORE r10, r0           ; dur
    MOV r10, r9
    LDI r15, 2
    ADD r10, r15
    STORE r10, r14           ; vol
    MOV r10, r9
    LDI r15, 3
    ADD r10, r15
    STORE r10, r4           ; active = 1

    BEEP r12, r0
    FRAME
    JMP mixer_loop
