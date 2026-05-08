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
    LDI r3, mixer_daemon
    SPAWN r3
    LDI r3, 0xFFA
    LOAD r3, r3             ; r3 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r6, 0xF00
    STORE r6, r3           ; RAM[0xF00] = mixer PID
    LDI r12, melody_child
    SPAWN r12

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r9, 1               ; channel 1
    LDI r15, 131             ; C3
    LDI r2, 600
    LDI r5, 70
    MSGSND r3
    FRAME

    LDI r9, 1
    LDI r15, 196             ; G3
    LDI r2, 600
    LDI r5, 70
    MSGSND r3
    FRAME

    LDI r9, 1
    LDI r15, 220             ; A3
    LDI r2, 600
    LDI r5, 70
    MSGSND r3
    FRAME

    LDI r9, 1
    LDI r15, 175             ; F3
    LDI r2, 800
    LDI r5, 80
    MSGSND r3
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r3
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r3, 0xF00
    LOAD r3, r3             ; r3 = mixer PID

    ; Play melody on channel 0
    LDI r9, 0               ; channel 0
    LDI r15, 523             ; C5
    LDI r2, 300
    LDI r5, 90
    MSGSND r3
    FRAME

    LDI r9, 0
    LDI r15, 587             ; D5
    LDI r2, 300
    LDI r5, 90
    MSGSND r3
    FRAME

    LDI r9, 0
    LDI r15, 659             ; E5
    LDI r2, 300
    LDI r5, 90
    MSGSND r3
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r1, 1               ; constant 1
    LDI r8, 4               ; max channels
    LDI r10, 0x200           ; channel table base

    ; Initialize channel table
    LDI r6, 0
    LDI r14, 0x200
    LDI r0, 0x210
mix_init:
    STORE r14, r6
    ADD r14, r1
    CMP r14, r0
    BLT r4, mix_init

mixer_loop:
    MSGRCV                  ; r4=sender, r9=channel, r15=freq, r2=dur, r5=vol
    CMP r9, r8
    BGE r4, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r6, r9
    LDI r7, 4
    MUL r6, r7
    ADD r6, r10
    STORE r6, r15           ; freq
    MOV r7, r6
    ADD r7, r1
    STORE r7, r2           ; dur
    MOV r7, r6
    LDI r14, 2
    ADD r7, r14
    STORE r7, r5           ; vol
    MOV r7, r6
    LDI r14, 3
    ADD r7, r14
    STORE r7, r1           ; active = 1

    BEEP r15, r2
    FRAME
    JMP mixer_loop
