; DESCRIPTION: A colored line centered at the screen with fixed size.

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
    LDI r14, mixer_daemon
    SPAWN r14
    LDI r14, 0xFFA
    LOAD r14, r14             ; r14 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r8, 0xF00
    STORE r8, r14           ; RAM[0xF00] = mixer PID
    LDI r12, melody_child
    SPAWN r12

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r2, 1               ; channel 1
    LDI r3, 131             ; C3
    LDI r4, 600
    LDI r7, 70
    MSGSND r14
    FRAME

    LDI r2, 1
    LDI r3, 196             ; G3
    LDI r4, 600
    LDI r7, 70
    MSGSND r14
    FRAME

    LDI r2, 1
    LDI r3, 220             ; A3
    LDI r4, 600
    LDI r7, 70
    MSGSND r14
    FRAME

    LDI r2, 1
    LDI r3, 175             ; F3
    LDI r4, 800
    LDI r7, 80
    MSGSND r14
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r14
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r14, 0xF00
    LOAD r14, r14             ; r14 = mixer PID

    ; Play melody on channel 0
    LDI r2, 0               ; channel 0
    LDI r3, 523             ; C5
    LDI r4, 300
    LDI r7, 90
    MSGSND r14
    FRAME

    LDI r2, 0
    LDI r3, 587             ; D5
    LDI r4, 300
    LDI r7, 90
    MSGSND r14
    FRAME

    LDI r2, 0
    LDI r3, 659             ; E5
    LDI r4, 300
    LDI r7, 90
    MSGSND r14
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r0, 1               ; constant 1
    LDI r11, 4               ; max channels
    LDI r5, 0x200           ; channel table base

    ; Initialize channel table
    LDI r8, 0
    LDI r10, 0x200
    LDI r9, 0x210
mix_init:
    STORE r10, r8
    ADD r10, r0
    CMP r10, r9
    BLT r6, mix_init

mixer_loop:
    MSGRCV                  ; r6=sender, r2=channel, r3=freq, r4=dur, r7=vol
    CMP r2, r11
    BGE r6, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r8, r2
    LDI r1, 4
    MUL r8, r1
    ADD r8, r5
    STORE r8, r3           ; freq
    MOV r1, r8
    ADD r1, r0
    STORE r1, r4           ; dur
    MOV r1, r8
    LDI r10, 2
    ADD r1, r10
    STORE r1, r7           ; vol
    MOV r1, r8
    LDI r10, 3
    ADD r1, r10
    STORE r1, r0           ; active = 1

    BEEP r3, r4
    FRAME
    JMP mixer_loop
