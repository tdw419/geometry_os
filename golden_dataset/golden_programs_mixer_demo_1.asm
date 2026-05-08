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
    LDI r11, mixer_daemon
    SPAWN r11
    LDI r11, 0xFFA
    LOAD r11, r11             ; r11 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r15, 0xF00
    STORE r15, r11           ; RAM[0xF00] = mixer PID
    LDI r5, melody_child
    SPAWN r5

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r12, 1               ; channel 1
    LDI r10, 131             ; C3
    LDI r8, 600
    LDI r6, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r10, 196             ; G3
    LDI r8, 600
    LDI r6, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r10, 220             ; A3
    LDI r8, 600
    LDI r6, 70
    MSGSND r11
    FRAME

    LDI r12, 1
    LDI r10, 175             ; F3
    LDI r8, 800
    LDI r6, 80
    MSGSND r11
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r11
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r11, 0xF00
    LOAD r11, r11             ; r11 = mixer PID

    ; Play melody on channel 0
    LDI r12, 0               ; channel 0
    LDI r10, 523             ; C5
    LDI r8, 300
    LDI r6, 90
    MSGSND r11
    FRAME

    LDI r12, 0
    LDI r10, 587             ; D5
    LDI r8, 300
    LDI r6, 90
    MSGSND r11
    FRAME

    LDI r12, 0
    LDI r10, 659             ; E5
    LDI r8, 300
    LDI r6, 90
    MSGSND r11
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r3, 1               ; constant 1
    LDI r14, 4               ; max channels
    LDI r7, 0x200           ; channel table base

    ; Initialize channel table
    LDI r15, 0
    LDI r9, 0x200
    LDI r0, 0x210
mix_init:
    STORE r9, r15
    ADD r9, r3
    CMP r9, r0
    BLT r4, mix_init

mixer_loop:
    MSGRCV                  ; r4=sender, r12=channel, r10=freq, r8=dur, r6=vol
    CMP r12, r14
    BGE r4, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r15, r12
    LDI r2, 4
    MUL r15, r2
    ADD r15, r7
    STORE r15, r10           ; freq
    MOV r2, r15
    ADD r2, r3
    STORE r2, r8           ; dur
    MOV r2, r15
    LDI r9, 2
    ADD r2, r9
    STORE r2, r6           ; vol
    MOV r2, r15
    LDI r9, 3
    ADD r2, r9
    STORE r2, r3           ; active = 1

    BEEP r10, r8
    FRAME
    JMP mixer_loop
