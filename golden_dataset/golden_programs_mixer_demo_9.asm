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
    LDI r0, mixer_daemon
    SPAWN r0
    LDI r0, 0xFFA
    LOAD r0, r0             ; r0 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r2, 0xF00
    STORE r2, r0           ; RAM[0xF00] = mixer PID
    LDI r6, melody_child
    SPAWN r6

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r3, 1               ; channel 1
    LDI r9, 131             ; C3
    LDI r4, 600
    LDI r5, 70
    MSGSND r0
    FRAME

    LDI r3, 1
    LDI r9, 196             ; G3
    LDI r4, 600
    LDI r5, 70
    MSGSND r0
    FRAME

    LDI r3, 1
    LDI r9, 220             ; A3
    LDI r4, 600
    LDI r5, 70
    MSGSND r0
    FRAME

    LDI r3, 1
    LDI r9, 175             ; F3
    LDI r4, 800
    LDI r5, 80
    MSGSND r0
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r0
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r0, 0xF00
    LOAD r0, r0             ; r0 = mixer PID

    ; Play melody on channel 0
    LDI r3, 0               ; channel 0
    LDI r9, 523             ; C5
    LDI r4, 300
    LDI r5, 90
    MSGSND r0
    FRAME

    LDI r3, 0
    LDI r9, 587             ; D5
    LDI r4, 300
    LDI r5, 90
    MSGSND r0
    FRAME

    LDI r3, 0
    LDI r9, 659             ; E5
    LDI r4, 300
    LDI r5, 90
    MSGSND r0
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r10, 1               ; constant 1
    LDI r12, 4               ; max channels
    LDI r8, 0x200           ; channel table base

    ; Initialize channel table
    LDI r2, 0
    LDI r7, 0x200
    LDI r14, 0x210
mix_init:
    STORE r7, r2
    ADD r7, r10
    CMP r7, r14
    BLT r15, mix_init

mixer_loop:
    MSGRCV                  ; r15=sender, r3=channel, r9=freq, r4=dur, r5=vol
    CMP r3, r12
    BGE r15, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r2, r3
    LDI r11, 4
    MUL r2, r11
    ADD r2, r8
    STORE r2, r9           ; freq
    MOV r11, r2
    ADD r11, r10
    STORE r11, r4           ; dur
    MOV r11, r2
    LDI r7, 2
    ADD r11, r7
    STORE r11, r5           ; vol
    MOV r11, r2
    LDI r7, 3
    ADD r11, r7
    STORE r11, r10           ; active = 1

    BEEP r9, r4
    FRAME
    JMP mixer_loop
