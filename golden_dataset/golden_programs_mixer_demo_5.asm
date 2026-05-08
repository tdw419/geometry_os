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
    LDI r5, mixer_daemon
    SPAWN r5
    LDI r5, 0xFFA
    LOAD r5, r5             ; r5 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r10, 0xF00
    STORE r10, r5           ; RAM[0xF00] = mixer PID
    LDI r8, melody_child
    SPAWN r8

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r11, 1               ; channel 1
    LDI r2, 131             ; C3
    LDI r0, 600
    LDI r15, 70
    MSGSND r5
    FRAME

    LDI r11, 1
    LDI r2, 196             ; G3
    LDI r0, 600
    LDI r15, 70
    MSGSND r5
    FRAME

    LDI r11, 1
    LDI r2, 220             ; A3
    LDI r0, 600
    LDI r15, 70
    MSGSND r5
    FRAME

    LDI r11, 1
    LDI r2, 175             ; F3
    LDI r0, 800
    LDI r15, 80
    MSGSND r5
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r5
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r5, 0xF00
    LOAD r5, r5             ; r5 = mixer PID

    ; Play melody on channel 0
    LDI r11, 0               ; channel 0
    LDI r2, 523             ; C5
    LDI r0, 300
    LDI r15, 90
    MSGSND r5
    FRAME

    LDI r11, 0
    LDI r2, 587             ; D5
    LDI r0, 300
    LDI r15, 90
    MSGSND r5
    FRAME

    LDI r11, 0
    LDI r2, 659             ; E5
    LDI r0, 300
    LDI r15, 90
    MSGSND r5
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r1, 1               ; constant 1
    LDI r12, 4               ; max channels
    LDI r4, 0x200           ; channel table base

    ; Initialize channel table
    LDI r10, 0
    LDI r13, 0x200
    LDI r14, 0x210
mix_init:
    STORE r13, r10
    ADD r13, r1
    CMP r13, r14
    BLT r7, mix_init

mixer_loop:
    MSGRCV                  ; r7=sender, r11=channel, r2=freq, r0=dur, r15=vol
    CMP r11, r12
    BGE r7, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r10, r11
    LDI r9, 4
    MUL r10, r9
    ADD r10, r4
    STORE r10, r2           ; freq
    MOV r9, r10
    ADD r9, r1
    STORE r9, r0           ; dur
    MOV r9, r10
    LDI r13, 2
    ADD r9, r13
    STORE r9, r15           ; vol
    MOV r9, r10
    LDI r13, 3
    ADD r9, r13
    STORE r9, r1           ; active = 1

    BEEP r2, r0
    FRAME
    JMP mixer_loop
