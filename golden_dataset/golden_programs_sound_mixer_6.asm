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
;   r11-r6 = shared RAM addresses
;   r12  = frequency
;   r0  = duration
;   r13  = channel
;
; Register convention (mixer daemon):
;   r3  = constant 1
;   r10  = constant 4 (max channels)
;   r7  = channel table base (0x200)
;   r11-r6 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r8, mixer_daemon
    SPAWN r8

    ; ── Set up shared RAM address pointers ──
    LDI r11, 0xF00          ; command flag address
    LDI r4, 0xF01          ; frequency address
    LDI r2, 0xF02          ; duration address
    LDI r6, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r12, 262
    LDI r0, 400
    LDI r13, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r12, 330
    LDI r0, 400
    LDI r13, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r12, 392
    LDI r0, 400
    LDI r13, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r12, 523
    LDI r0, 600
    LDI r13, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r12, 440
    LDI r0, 500
    LDI r13, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r1, 2               ; shutdown flag
    STORE r11, r1

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r12=freq, r0=dur, r13=channel
; Uses: r1 (scratch)
; Preserves: r12, r0, r13, r11-r6
write_note:
    PUSH r31
wait_ready:
    LOAD r1, r11            ; r1 = command flag
    JNZ r1, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r4, r12            ; frequency
    STORE r2, r0            ; duration
    STORE r6, r13            ; channel
    LDI r1, 1
    STORE r11, r1            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r3, 1               ; constant 1
    LDI r10, 4               ; max channels
    LDI r7, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r11, 0xF00          ; command flag
    LDI r4, 0xF01          ; frequency
    LDI r2, 0xF02          ; duration
    LDI r6, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r1, r11            ; r1 = command flag
    JZ r1, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r12, 2
    CMP r1, r12
    JZ r5, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r12, r4            ; frequency
    LOAD r0, r2            ; duration
    LOAD r13, r6            ; channel

    ; Validate channel (0-3)
    CMP r13, r10
    BGE r5, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r1, r13              ; r1 = channel
    LDI r8, 3
    MUL r1, r8              ; r1 = channel * 3
    ADD r1, r7              ; r1 = 0x200 + channel * 3

    STORE r1, r12            ; freq at base+0
    MOV r8, r1
    ADD r8, r3
    STORE r8, r0            ; dur at base+1
    MOV r8, r1
    LDI r15, 2
    ADD r8, r15
    STORE r8, r3            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r12, r0

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r1, 0
    STORE r11, r1

    JMP mixer_loop

mixer_shutdown:
    LDI r1, 0
    STORE r11, r1
    HALT
