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
;   r15-r3 = shared RAM addresses
;   r1  = frequency
;   r6  = duration
;   r13  = channel
;
; Register convention (mixer daemon):
;   r11  = constant 1
;   r8  = constant 4 (max channels)
;   r5  = channel table base (0x200)
;   r15-r3 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r0, mixer_daemon
    SPAWN r0

    ; ── Set up shared RAM address pointers ──
    LDI r15, 0xF00          ; command flag address
    LDI r12, 0xF01          ; frequency address
    LDI r2, 0xF02          ; duration address
    LDI r3, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r1, 262
    LDI r6, 400
    LDI r13, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r1, 330
    LDI r6, 400
    LDI r13, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r1, 392
    LDI r6, 400
    LDI r13, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r1, 523
    LDI r6, 600
    LDI r13, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r1, 440
    LDI r6, 500
    LDI r13, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r9, 2               ; shutdown flag
    STORE r15, r9

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r1=freq, r6=dur, r13=channel
; Uses: r9 (scratch)
; Preserves: r1, r6, r13, r15-r3
write_note:
    PUSH r31
wait_ready:
    LOAD r9, r15            ; r9 = command flag
    JNZ r9, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r12, r1            ; frequency
    STORE r2, r6            ; duration
    STORE r3, r13            ; channel
    LDI r9, 1
    STORE r15, r9            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r11, 1               ; constant 1
    LDI r8, 4               ; max channels
    LDI r5, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r15, 0xF00          ; command flag
    LDI r12, 0xF01          ; frequency
    LDI r2, 0xF02          ; duration
    LDI r3, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r9, r15            ; r9 = command flag
    JZ r9, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r1, 2
    CMP r9, r1
    JZ r7, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r1, r12            ; frequency
    LOAD r6, r2            ; duration
    LOAD r13, r3            ; channel

    ; Validate channel (0-3)
    CMP r13, r8
    BGE r7, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r9, r13              ; r9 = channel
    LDI r0, 3
    MUL r9, r0              ; r9 = channel * 3
    ADD r9, r5              ; r9 = 0x200 + channel * 3

    STORE r9, r1            ; freq at base+0
    MOV r0, r9
    ADD r0, r11
    STORE r0, r6            ; dur at base+1
    MOV r0, r9
    LDI r14, 2
    ADD r0, r14
    STORE r0, r11            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r1, r6

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r9, 0
    STORE r15, r9

    JMP mixer_loop

mixer_shutdown:
    LDI r9, 0
    STORE r15, r9
    HALT
