; DESCRIPTION: Render a red object at the screen.

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
;   r5-r6 = shared RAM addresses
;   r12  = frequency
;   r3  = duration
;   r8  = channel
;
; Register convention (mixer daemon):
;   r9  = constant 1
;   r4  = constant 4 (max channels)
;   r10  = channel table base (0x200)
;   r5-r6 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r7, mixer_daemon
    SPAWN r7

    ; ── Set up shared RAM address pointers ──
    LDI r5, 0xF00          ; command flag address
    LDI r14, 0xF01          ; frequency address
    LDI r1, 0xF02          ; duration address
    LDI r6, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r12, 262
    LDI r3, 400
    LDI r8, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r12, 330
    LDI r3, 400
    LDI r8, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r12, 392
    LDI r3, 400
    LDI r8, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r12, 523
    LDI r3, 600
    LDI r8, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r12, 440
    LDI r3, 500
    LDI r8, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r11, 2               ; shutdown flag
    STORE r5, r11

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r12=freq, r3=dur, r8=channel
; Uses: r11 (scratch)
; Preserves: r12, r3, r8, r5-r6
write_note:
    PUSH r31
wait_ready:
    LOAD r11, r5            ; r11 = command flag
    JNZ r11, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r14, r12            ; frequency
    STORE r1, r3            ; duration
    STORE r6, r8            ; channel
    LDI r11, 1
    STORE r5, r11            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r9, 1               ; constant 1
    LDI r4, 4               ; max channels
    LDI r10, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r5, 0xF00          ; command flag
    LDI r14, 0xF01          ; frequency
    LDI r1, 0xF02          ; duration
    LDI r6, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r11, r5            ; r11 = command flag
    JZ r11, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r12, 2
    CMP r11, r12
    JZ r0, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r12, r14            ; frequency
    LOAD r3, r1            ; duration
    LOAD r8, r6            ; channel

    ; Validate channel (0-3)
    CMP r8, r4
    BGE r0, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r11, r8              ; r11 = channel
    LDI r7, 3
    MUL r11, r7              ; r11 = channel * 3
    ADD r11, r10              ; r11 = 0x200 + channel * 3

    STORE r11, r12            ; freq at base+0
    MOV r7, r11
    ADD r7, r9
    STORE r7, r3            ; dur at base+1
    MOV r7, r11
    LDI r15, 2
    ADD r7, r15
    STORE r7, r9            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r12, r3

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r11, 0
    STORE r5, r11

    JMP mixer_loop

mixer_shutdown:
    LDI r11, 0
    STORE r5, r11
    HALT
