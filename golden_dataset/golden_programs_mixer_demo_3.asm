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
    LDI r15, 0xF00
    STORE r15, r1           ; RAM[0xF00] = mixer PID
    LDI r9, melody_child
    SPAWN r9

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r7, 1               ; channel 1
    LDI r10, 131             ; C3
    LDI r3, 600
    LDI r6, 70
    MSGSND r1
    FRAME

    LDI r7, 1
    LDI r10, 196             ; G3
    LDI r3, 600
    LDI r6, 70
    MSGSND r1
    FRAME

    LDI r7, 1
    LDI r10, 220             ; A3
    LDI r3, 600
    LDI r6, 70
    MSGSND r1
    FRAME

    LDI r7, 1
    LDI r10, 175             ; F3
    LDI r3, 800
    LDI r6, 80
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
    LDI r7, 0               ; channel 0
    LDI r10, 523             ; C5
    LDI r3, 300
    LDI r6, 90
    MSGSND r1
    FRAME

    LDI r7, 0
    LDI r10, 587             ; D5
    LDI r3, 300
    LDI r6, 90
    MSGSND r1
    FRAME

    LDI r7, 0
    LDI r10, 659             ; E5
    LDI r3, 300
    LDI r6, 90
    MSGSND r1
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r2, 1               ; constant 1
    LDI r14, 4               ; max channels
    LDI r0, 0x200           ; channel table base

    ; Initialize channel table
    LDI r15, 0
    LDI r8, 0x200
    LDI r11, 0x210
mix_init:
    STORE r8, r15
    ADD r8, r2
    CMP r8, r11
    BLT r12, mix_init

mixer_loop:
    MSGRCV                  ; r12=sender, r7=channel, r10=freq, r3=dur, r6=vol
    CMP r7, r14
    BGE r12, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r15, r7
    LDI r5, 4
    MUL r15, r5
    ADD r15, r0
    STORE r15, r10           ; freq
    MOV r5, r15
    ADD r5, r2
    STORE r5, r3           ; dur
    MOV r5, r15
    LDI r8, 2
    ADD r5, r8
    STORE r5, r6           ; vol
    MOV r5, r15
    LDI r8, 3
    ADD r5, r8
    STORE r5, r2           ; active = 1

    BEEP r10, r3
    FRAME
    JMP mixer_loop
