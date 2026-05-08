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
;   r3-r0 = shared RAM addresses
;   r7  = frequency
;   r6  = duration
;   r1  = channel
;
; Register convention (mixer daemon):
;   r10  = constant 1
;   r13  = constant 4 (max channels)
;   r5  = channel table base (0x200)
;   r3-r0 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r14, mixer_daemon
    SPAWN r14

    ; ── Set up shared RAM address pointers ──
    LDI r3, 0xF00          ; command flag address
    LDI r2, 0xF01          ; frequency address
    LDI r8, 0xF02          ; duration address
    LDI r0, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r7, 262
    LDI r6, 400
    LDI r1, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r7, 330
    LDI r6, 400
    LDI r1, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r7, 392
    LDI r6, 400
    LDI r1, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r7, 523
    LDI r6, 600
    LDI r1, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r7, 440
    LDI r6, 500
    LDI r1, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r11, 2               ; shutdown flag
    STORE r3, r11

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r7=freq, r6=dur, r1=channel
; Uses: r11 (scratch)
; Preserves: r7, r6, r1, r3-r0
write_note:
    PUSH r31
wait_ready:
    LOAD r11, r3            ; r11 = command flag
    JNZ r11, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r2, r7            ; frequency
    STORE r8, r6            ; duration
    STORE r0, r1            ; channel
    LDI r11, 1
    STORE r3, r11            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r10, 1               ; constant 1
    LDI r13, 4               ; max channels
    LDI r5, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r3, 0xF00          ; command flag
    LDI r2, 0xF01          ; frequency
    LDI r8, 0xF02          ; duration
    LDI r0, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r11, r3            ; r11 = command flag
    JZ r11, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r7, 2
    CMP r11, r7
    JZ r4, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r7, r2            ; frequency
    LOAD r6, r8            ; duration
    LOAD r1, r0            ; channel

    ; Validate channel (0-3)
    CMP r1, r13
    BGE r4, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r11, r1              ; r11 = channel
    LDI r14, 3
    MUL r11, r14              ; r11 = channel * 3
    ADD r11, r5              ; r11 = 0x200 + channel * 3

    STORE r11, r7            ; freq at base+0
    MOV r14, r11
    ADD r14, r10
    STORE r14, r6            ; dur at base+1
    MOV r14, r11
    LDI r9, 2
    ADD r14, r9
    STORE r14, r10            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r7, r6

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r11, 0
    STORE r3, r11

    JMP mixer_loop

mixer_shutdown:
    LDI r11, 0
    STORE r3, r11
    HALT
