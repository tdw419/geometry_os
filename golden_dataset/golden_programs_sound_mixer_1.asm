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
;   r7-r11 = shared RAM addresses
;   r0  = frequency
;   r4  = duration
;   r9  = channel
;
; Register convention (mixer daemon):
;   r3  = constant 1
;   r15  = constant 4 (max channels)
;   r6  = channel table base (0x200)
;   r7-r11 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r5, mixer_daemon
    SPAWN r5

    ; ── Set up shared RAM address pointers ──
    LDI r7, 0xF00          ; command flag address
    LDI r12, 0xF01          ; frequency address
    LDI r14, 0xF02          ; duration address
    LDI r11, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r0, 262
    LDI r4, 400
    LDI r9, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r0, 330
    LDI r4, 400
    LDI r9, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r0, 392
    LDI r4, 400
    LDI r9, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r0, 523
    LDI r4, 600
    LDI r9, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r0, 440
    LDI r4, 500
    LDI r9, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r10, 2               ; shutdown flag
    STORE r7, r10

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r0=freq, r4=dur, r9=channel
; Uses: r10 (scratch)
; Preserves: r0, r4, r9, r7-r11
write_note:
    PUSH r31
wait_ready:
    LOAD r10, r7            ; r10 = command flag
    JNZ r10, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r12, r0            ; frequency
    STORE r14, r4            ; duration
    STORE r11, r9            ; channel
    LDI r10, 1
    STORE r7, r10            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r3, 1               ; constant 1
    LDI r15, 4               ; max channels
    LDI r6, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r7, 0xF00          ; command flag
    LDI r12, 0xF01          ; frequency
    LDI r14, 0xF02          ; duration
    LDI r11, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r10, r7            ; r10 = command flag
    JZ r10, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r0, 2
    CMP r10, r0
    JZ r2, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r0, r12            ; frequency
    LOAD r4, r14            ; duration
    LOAD r9, r11            ; channel

    ; Validate channel (0-3)
    CMP r9, r15
    BGE r2, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r10, r9              ; r10 = channel
    LDI r5, 3
    MUL r10, r5              ; r10 = channel * 3
    ADD r10, r6              ; r10 = 0x200 + channel * 3

    STORE r10, r0            ; freq at base+0
    MOV r5, r10
    ADD r5, r3
    STORE r5, r4            ; dur at base+1
    MOV r5, r10
    LDI r8, 2
    ADD r5, r8
    STORE r5, r3            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r0, r4

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r10, 0
    STORE r7, r10

    JMP mixer_loop

mixer_shutdown:
    LDI r10, 0
    STORE r7, r10
    HALT
