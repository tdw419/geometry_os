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
    LDI r0, 0xF00
    STORE r0, r11           ; RAM[0xF00] = mixer PID
    LDI r14, melody_child
    SPAWN r14

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r2, 1               ; channel 1
    LDI r13, 131             ; C3
    LDI r10, 600
    LDI r3, 70
    MSGSND r11
    FRAME

    LDI r2, 1
    LDI r13, 196             ; G3
    LDI r10, 600
    LDI r3, 70
    MSGSND r11
    FRAME

    LDI r2, 1
    LDI r13, 220             ; A3
    LDI r10, 600
    LDI r3, 70
    MSGSND r11
    FRAME

    LDI r2, 1
    LDI r13, 175             ; F3
    LDI r10, 800
    LDI r3, 80
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
    LDI r2, 0               ; channel 0
    LDI r13, 523             ; C5
    LDI r10, 300
    LDI r3, 90
    MSGSND r11
    FRAME

    LDI r2, 0
    LDI r13, 587             ; D5
    LDI r10, 300
    LDI r3, 90
    MSGSND r11
    FRAME

    LDI r2, 0
    LDI r13, 659             ; E5
    LDI r10, 300
    LDI r3, 90
    MSGSND r11
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r15, 1               ; constant 1
    LDI r4, 4               ; max channels
    LDI r6, 0x200           ; channel table base

    ; Initialize channel table
    LDI r0, 0
    LDI r9, 0x200
    LDI r1, 0x210
mix_init:
    STORE r9, r0
    ADD r9, r15
    CMP r9, r1
    BLT r8, mix_init

mixer_loop:
    MSGRCV                  ; r8=sender, r2=channel, r13=freq, r10=dur, r3=vol
    CMP r2, r4
    BGE r8, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r0, r2
    LDI r5, 4
    MUL r0, r5
    ADD r0, r6
    STORE r0, r13           ; freq
    MOV r5, r0
    ADD r5, r15
    STORE r5, r10           ; dur
    MOV r5, r0
    LDI r9, 2
    ADD r5, r9
    STORE r5, r3           ; vol
    MOV r5, r0
    LDI r9, 3
    ADD r5, r9
    STORE r5, r15           ; active = 1

    BEEP r13, r10
    FRAME
    JMP mixer_loop
