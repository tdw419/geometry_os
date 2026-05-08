; DESCRIPTION: A red object centered at the screen with fixed size.

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
;   r11-r8 = shared RAM addresses
;   r2  = frequency
;   r15  = duration
;   r4  = channel
;
; Register convention (mixer daemon):
;   r12  = constant 1
;   r10  = constant 4 (max channels)
;   r3  = channel table base (0x200)
;   r11-r8 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r14, mixer_daemon
    SPAWN r14

    ; ── Set up shared RAM address pointers ──
    LDI r11, 0xF00          ; command flag address
    LDI r7, 0xF01          ; frequency address
    LDI r9, 0xF02          ; duration address
    LDI r8, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r2, 262
    LDI r15, 400
    LDI r4, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r2, 330
    LDI r15, 400
    LDI r4, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r2, 392
    LDI r15, 400
    LDI r4, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r2, 523
    LDI r15, 600
    LDI r4, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r2, 440
    LDI r15, 500
    LDI r4, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r1, 2               ; shutdown flag
    STORE r11, r1

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r2=freq, r15=dur, r4=channel
; Uses: r1 (scratch)
; Preserves: r2, r15, r4, r11-r8
write_note:
    PUSH r31
wait_ready:
    LOAD r1, r11            ; r1 = command flag
    JNZ r1, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r7, r2            ; frequency
    STORE r9, r15            ; duration
    STORE r8, r4            ; channel
    LDI r1, 1
    STORE r11, r1            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r12, 1               ; constant 1
    LDI r10, 4               ; max channels
    LDI r3, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r11, 0xF00          ; command flag
    LDI r7, 0xF01          ; frequency
    LDI r9, 0xF02          ; duration
    LDI r8, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r1, r11            ; r1 = command flag
    JZ r1, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r2, 2
    CMP r1, r2
    JZ r6, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r2, r7            ; frequency
    LOAD r15, r9            ; duration
    LOAD r4, r8            ; channel

    ; Validate channel (0-3)
    CMP r4, r10
    BGE r6, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r1, r4              ; r1 = channel
    LDI r14, 3
    MUL r1, r14              ; r1 = channel * 3
    ADD r1, r3              ; r1 = 0x200 + channel * 3

    STORE r1, r2            ; freq at base+0
    MOV r14, r1
    ADD r14, r12
    STORE r14, r15            ; dur at base+1
    MOV r14, r1
    LDI r5, 2
    ADD r14, r5
    STORE r14, r12            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r2, r15

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r1, 0
    STORE r11, r1

    JMP mixer_loop

mixer_shutdown:
    LDI r1, 0
    STORE r11, r1
    HALT
