; DESCRIPTION: The GeOS assembly code implements a sound mixer daemon with a music player that uses inter-process communication (IPC) via shared RAM polling. The parent process writes note data to shared RAM, and the child process (mixer daemon) polls this data to play notes using the BEEP instruction. The shared RAM protocol defines command flags, frequency, duration, and channel information, while the mixer daemon manages up to four channels using a channel table in its own RAM.

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
;   r14-r5 = shared RAM addresses
;   r6  = frequency
;   r2  = duration
;   r12  = channel
;
; Register convention (mixer daemon):
;   r9  = constant 1
;   r11  = constant 4 (max channels)
;   r13  = channel table base (0x200)
;   r14-r5 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r8, mixer_daemon
    SPAWN r8

    ; ── Set up shared RAM address pointers ──
    LDI r14, 0xF00          ; command flag address
    LDI r3, 0xF01          ; frequency address
    LDI r10, 0xF02          ; duration address
    LDI r5, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r6, 262
    LDI r2, 400
    LDI r12, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r6, 330
    LDI r2, 400
    LDI r12, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r6, 392
    LDI r2, 400
    LDI r12, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r6, 523
    LDI r2, 600
    LDI r12, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r6, 440
    LDI r2, 500
    LDI r12, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r4, 2               ; shutdown flag
    STORE r14, r4

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r6=freq, r2=dur, r12=channel
; Uses: r4 (scratch)
; Preserves: r6, r2, r12, r14-r5
write_note:
    PUSH r31
wait_ready:
    LOAD r4, r14            ; r4 = command flag
    JNZ r4, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r3, r6            ; frequency
    STORE r10, r2            ; duration
    STORE r5, r12            ; channel
    LDI r4, 1
    STORE r14, r4            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r9, 1               ; constant 1
    LDI r11, 4               ; max channels
    LDI r13, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r14, 0xF00          ; command flag
    LDI r3, 0xF01          ; frequency
    LDI r10, 0xF02          ; duration
    LDI r5, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r4, r14            ; r4 = command flag
    JZ r4, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r6, 2
    CMP r4, r6
    JZ r15, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r6, r3            ; frequency
    LOAD r2, r10            ; duration
    LOAD r12, r5            ; channel

    ; Validate channel (0-3)
    CMP r12, r11
    BGE r15, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r4, r12              ; r4 = channel
    LDI r8, 3
    MUL r4, r8              ; r4 = channel * 3
    ADD r4, r13              ; r4 = 0x200 + channel * 3

    STORE r4, r6            ; freq at base+0
    MOV r8, r4
    ADD r8, r9
    STORE r8, r2            ; dur at base+1
    MOV r8, r4
    LDI r1, 2
    ADD r8, r1
    STORE r8, r9            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r6, r2

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r4, 0
    STORE r14, r4

    JMP mixer_loop

mixer_shutdown:
    LDI r4, 0
    STORE r14, r4
    HALT
