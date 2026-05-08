; DESCRIPTION: Render a colored line at the screen.

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
    LDI r10, mixer_daemon
    SPAWN r10
    LDI r10, 0xFFA
    LOAD r10, r10             ; r10 = mixer PID

    ; ── Spawn melody player on channel 0 ──
    ; Share mixer PID via shared RAM (0xF00)
    LDI r13, 0xF00
    STORE r13, r10           ; RAM[0xF00] = mixer PID
    LDI r14, melody_child
    SPAWN r14

    ; ── Parent: play bass line on channel 1 ──
    ; Bass: C3, G3, A3, F3
    LDI r8, 1               ; channel 1
    LDI r15, 131             ; C3
    LDI r7, 600
    LDI r3, 70
    MSGSND r10
    FRAME

    LDI r8, 1
    LDI r15, 196             ; G3
    LDI r7, 600
    LDI r3, 70
    MSGSND r10
    FRAME

    LDI r8, 1
    LDI r15, 220             ; A3
    LDI r7, 600
    LDI r3, 70
    MSGSND r10
    FRAME

    LDI r8, 1
    LDI r15, 175             ; F3
    LDI r7, 800
    LDI r3, 80
    MSGSND r10
    FRAME

    ; Let children finish
    FRAME
    FRAME
    FRAME

    ; Kill mixer and halt
    KILL r10
    HALT

; ── Melody Child (channel 0) ────────────────────────────────────
.org 0x400
melody_child:
    LDI r30, 0xFF00         ; SP

    ; Read mixer PID from shared RAM
    LDI r10, 0xF00
    LOAD r10, r10             ; r10 = mixer PID

    ; Play melody on channel 0
    LDI r8, 0               ; channel 0
    LDI r15, 523             ; C5
    LDI r7, 300
    LDI r3, 90
    MSGSND r10
    FRAME

    LDI r8, 0
    LDI r15, 587             ; D5
    LDI r7, 300
    LDI r3, 90
    MSGSND r10
    FRAME

    LDI r8, 0
    LDI r15, 659             ; E5
    LDI r7, 300
    LDI r3, 90
    MSGSND r10
    FRAME

    HALT

; ── Mixer Daemon ────────────────────────────────────────────────
.org 0x800
mixer_daemon:
    LDI r30, 0xFF00         ; SP
    LDI r2, 1               ; constant 1
    LDI r4, 4               ; max channels
    LDI r11, 0x200           ; channel table base

    ; Initialize channel table
    LDI r13, 0
    LDI r1, 0x200
    LDI r9, 0x210
mix_init:
    STORE r1, r13
    ADD r1, r2
    CMP r1, r9
    BLT r6, mix_init

mixer_loop:
    MSGRCV                  ; r6=sender, r8=channel, r15=freq, r7=dur, r3=vol
    CMP r8, r4
    BGE r6, mixer_loop      ; skip invalid channel

    ; Store in channel table
    MOV r13, r8
    LDI r0, 4
    MUL r13, r0
    ADD r13, r11
    STORE r13, r15           ; freq
    MOV r0, r13
    ADD r0, r2
    STORE r0, r7           ; dur
    MOV r0, r13
    LDI r1, 2
    ADD r0, r1
    STORE r0, r3           ; vol
    MOV r0, r13
    LDI r1, 3
    ADD r0, r1
    STORE r0, r2           ; active = 1

    BEEP r15, r7
    FRAME
    JMP mixer_loop
