; DESCRIPTION: Display a object using color red at the screen.

; sound_mixer.asm -- Sound Mixer Daemon with Music Player (Phase 99)
;
; Demonstrates IPC-based audio control using shared RAM polling.
; The parent process (music player) writes note data to shared RAM,
; and the mixer daemon (child process) polls and plays via BEEP.
;
; Shared RAM protocol (0xF00-0xF03, in identity-mapped page 3):
;   0xF00 = command flag (0 = no command, 1 = play note, 2 = shutdown)
;   0xF01 = frequency (Hz)
;   0xF02 = duration (ms)
;   0xF03 = channel (0-3)
;
; Channel table in mixer RAM (0x200):
;   [ch0_freq, ch0_dur, ch0_active,
;    ch1_freq, ch1_dur, ch1_active,
;    ch2_freq, ch2_dur, ch2_active,
;    ch3_freq, ch3_dur, ch3_active]
;
; Register convention (parent):
;   r10-r1 = shared RAM addresses
;   r13  = frequency
;   r7  = duration
;   r9  = channel
;
; Register convention (mixer daemon):
;   r8  = constant 1
;   r3  = constant 4 (max channels)
;   r14  = channel table base (0x200)
;   r10-r1 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r15, mixer_daemon
    SPAWN r15

    ; ── Set up shared RAM address pointers ──
    LDI r10, 0xF00          ; command flag address
    LDI r0, 0xF01          ; frequency address
    LDI r11, 0xF02          ; duration address
    LDI r1, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r13, 262
    LDI r7, 400
    LDI r9, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r13, 330
    LDI r7, 400
    LDI r9, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r13, 392
    LDI r7, 400
    LDI r9, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r13, 523
    LDI r7, 600
    LDI r9, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r13, 440
    LDI r7, 500
    LDI r9, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r2, 2               ; shutdown flag
    STORE r10, r2

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r13=freq, r7=dur, r9=channel
; Uses: r2 (scratch)
; Preserves: r13, r7, r9, r10-r1
write_note:
    PUSH r31
wait_ready:
    LOAD r2, r10            ; r2 = command flag
    JNZ r2, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r0, r13            ; frequency
    STORE r11, r7            ; duration
    STORE r1, r9            ; channel
    LDI r2, 1
    STORE r10, r2            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r8, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r14, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r10, 0xF00          ; command flag
    LDI r0, 0xF01          ; frequency
    LDI r11, 0xF02          ; duration
    LDI r1, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r2, r10            ; r2 = command flag
    JZ r2, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r13, 2
    CMP r2, r13
    JZ r4, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r13, r0            ; frequency
    LOAD r7, r11            ; duration
    LOAD r9, r1            ; channel

    ; Validate channel (0-3)
    CMP r9, r3
    BGE r4, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r2, r9              ; r2 = channel
    LDI r15, 3
    MUL r2, r15              ; r2 = channel * 3
    ADD r2, r14              ; r2 = 0x200 + channel * 3

    STORE r2, r13            ; freq at base+0
    MOV r15, r2
    ADD r15, r8
    STORE r15, r7            ; dur at base+1
    MOV r15, r2
    LDI r6, 2
    ADD r15, r6
    STORE r15, r8            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r13, r7

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r2, 0
    STORE r10, r2

    JMP mixer_loop

mixer_shutdown:
    LDI r2, 0
    STORE r10, r2
    HALT
