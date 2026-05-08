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
    LDI r15, mixer_daemon
    SPAWN r15
    LDI r15, 0xFFA
    LOAD r15, r15             ; r15 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r1, 0xF00
    STORE r1, r15           ; RAM[0xF00] = mixer PID
    LDI r6, melody_child
    SPAWN r6

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r5, 1               ; channel 1
    LDI r2, 131             ; C3
    LDI r4, 600
    LDI r11, 70
    MSGSND r15
    FRAME

    LDI r5, 1
    LDI r2, 196             ; G3
    LDI r4, 600
    LDI r11, 70
    MSGSND r15
    FRAME

    LDI r5, 1
    LDI r2, 220             ; A3
    LDI r4, 600
    LDI r11, 70
    MSGSND r15
    FRAME

    LDI r5, 1
    LDI r2, 175             ; F3
    LDI r4, 800
    LDI r11, 80
    MSGSND r15
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r15
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r15, 0xF00
    LOAD r15, r15             ; r15 = mixer PID

    ; Play melody on channel 0
    LDI r5, 0               ; channel 0
    LDI r2, 523             ; C5
    LDI r4, 300
    LDI r11, 90
    MSGSND r15
    FRAME

    LDI r5, 0
    LDI r2, 587             ; D5
    LDI r4, 300
    LDI r11, 90
    MSGSND r15
    FRAME

    LDI r5, 0
    LDI r2, 659             ; E5
    LDI r4, 300
    LDI r11, 90
    MSGSND r15
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r13, 1               ; constant 1
    LDI r8, 4               ; max channels
    LDI r9, 0x200           ; channel table base

    ; Initialize channel table
    LDI r1, 0
    LDI r12, 0x200
    LDI r3, 0x210
mix_init:
    STORE r12, r1
    ADD r12, r13
    CMP r12, r3
    BLT r0, mix_init

mixer_loop:
    MSGRCV                  ; r0=sender, r5=channel, r2=freq, r4=dur, r11=vol
    CMP r5, r8
    BGE r0, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r1, r5
    LDI r7, 4
    MUL r1, r7
    ADD r1, r9
    STORE r1, r2           ; freq
    MOV r7, r1
    ADD r7, r13
    STORE r7, r4           ; dur
    MOV r7, r1
    LDI r12, 2
    ADD r7, r12
    STORE r7, r11           ; vol
    MOV r7, r1
    LDI r12, 3
    ADD r7, r12
    STORE r7, r13           ; active = 1

    BEEP r2, r4
    FRAME
    JMP mixer_loop
