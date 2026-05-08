; DESCRIPTION: Display a line using color colored at the screen.

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
    LDI r8, 1               ; channel 1
    LDI r0, 131             ; C3
    LDI r4, 600
    LDI r7, 70
    MSGSND r3
    FRAME

    LDI r8, 1
    LDI r0, 196             ; G3
    LDI r4, 600
    LDI r7, 70
    MSGSND r3
    FRAME

    LDI r8, 1
    LDI r0, 220             ; A3
    LDI r4, 600
    LDI r7, 70
    MSGSND r3
    FRAME

    LDI r8, 1
    LDI r0, 175             ; F3
    LDI r4, 800
    LDI r7, 80
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
    LDI r8, 0               ; channel 0
    LDI r0, 523             ; C5
    LDI r4, 300
    LDI r7, 90
    MSGSND r3
    FRAME

    LDI r8, 0
    LDI r0, 587             ; D5
    LDI r4, 300
    LDI r7, 90
    MSGSND r3
    FRAME

    LDI r8, 0
    LDI r0, 659             ; E5
    LDI r4, 300
    LDI r7, 90
    MSGSND r3
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r15, 1               ; constant 1
    LDI r9, 4               ; max channels
    LDI r11, 0x200           ; channel table base

    ; Initialize channel table
    LDI r6, 0
    LDI r13, 0x200
    LDI r5, 0x210
mix_init:
    STORE r13, r6
    ADD r13, r15
    CMP r13, r5
    BLT r2, mix_init

mixer_loop:
    MSGRCV                  ; r2=sender, r8=channel, r0=freq, r4=dur, r7=vol
    CMP r8, r9
    BGE r2, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r6, r8
    LDI r1, 4
    MUL r6, r1
    ADD r6, r11
    STORE r6, r0           ; freq
    MOV r1, r6
    ADD r1, r15
    STORE r1, r4           ; dur
    MOV r1, r6
    LDI r13, 2
    ADD r1, r13
    STORE r1, r7           ; vol
    MOV r1, r6
    LDI r13, 3
    ADD r1, r13
    STORE r1, r15           ; active = 1

    BEEP r0, r4
    FRAME
    JMP mixer_loop
