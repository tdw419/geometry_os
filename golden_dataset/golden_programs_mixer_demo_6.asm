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
    LDI r4, mixer_daemon
    SPAWN r4
    LDI r4, 0xFFA
    LOAD r4, r4             ; r4 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r7, 0xF00
    STORE r7, r4           ; RAM[0xF00] = mixer PID
    LDI r2, melody_child
    SPAWN r2

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r1, 1               ; channel 1
    LDI r8, 131             ; C3
    LDI r9, 600
    LDI r10, 70
    MSGSND r4
    FRAME

    LDI r1, 1
    LDI r8, 196             ; G3
    LDI r9, 600
    LDI r10, 70
    MSGSND r4
    FRAME

    LDI r1, 1
    LDI r8, 220             ; A3
    LDI r9, 600
    LDI r10, 70
    MSGSND r4
    FRAME

    LDI r1, 1
    LDI r8, 175             ; F3
    LDI r9, 800
    LDI r10, 80
    MSGSND r4
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r4
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r4, 0xF00
    LOAD r4, r4             ; r4 = mixer PID

    ; Play melody on channel 0
    LDI r1, 0               ; channel 0
    LDI r8, 523             ; C5
    LDI r9, 300
    LDI r10, 90
    MSGSND r4
    FRAME

    LDI r1, 0
    LDI r8, 587             ; D5
    LDI r9, 300
    LDI r10, 90
    MSGSND r4
    FRAME

    LDI r1, 0
    LDI r8, 659             ; E5
    LDI r9, 300
    LDI r10, 90
    MSGSND r4
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r13, 1               ; constant 1
    LDI r12, 4               ; max channels
    LDI r3, 0x200           ; channel table base

    ; Initialize channel table
    LDI r7, 0
    LDI r0, 0x200
    LDI r11, 0x210
mix_init:
    STORE r0, r7
    ADD r0, r13
    CMP r0, r11
    BLT r14, mix_init

mixer_loop:
    MSGRCV                  ; r14=sender, r1=channel, r8=freq, r9=dur, r10=vol
    CMP r1, r12
    BGE r14, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r7, r1
    LDI r6, 4
    MUL r7, r6
    ADD r7, r3
    STORE r7, r8           ; freq
    MOV r6, r7
    ADD r6, r13
    STORE r6, r9           ; dur
    MOV r6, r7
    LDI r0, 2
    ADD r6, r0
    STORE r6, r10           ; vol
    MOV r6, r7
    LDI r0, 3
    ADD r6, r0
    STORE r6, r13           ; active = 1

    BEEP r8, r9
    FRAME
    JMP mixer_loop
