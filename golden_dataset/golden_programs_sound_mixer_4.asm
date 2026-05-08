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
;   r10-r9 = shared RAM addresses
;   r2  = frequency
;   r7  = duration
;   r3  = channel
;
; Register convention (mixer daemon):
;   r13  = constant 1
;   r6  = constant 4 (max channels)
;   r4  = channel table base (0x200)
;   r10-r9 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r11, mixer_daemon
    SPAWN r11

    ; ── Set up shared RAM address pointers ──
    LDI r10, 0xF00          ; command flag address
    LDI r0, 0xF01          ; frequency address
    LDI r5, 0xF02          ; duration address
    LDI r9, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r2, 262
    LDI r7, 400
    LDI r3, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r2, 330
    LDI r7, 400
    LDI r3, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r2, 392
    LDI r7, 400
    LDI r3, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r2, 523
    LDI r7, 600
    LDI r3, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r2, 440
    LDI r7, 500
    LDI r3, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r12, 2               ; shutdown flag
    STORE r10, r12

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r2=freq, r7=dur, r3=channel
; Uses: r12 (scratch)
; Preserves: r2, r7, r3, r10-r9
write_note:
    PUSH r31
wait_ready:
    LOAD r12, r10            ; r12 = command flag
    JNZ r12, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r0, r2            ; frequency
    STORE r5, r7            ; duration
    STORE r9, r3            ; channel
    LDI r12, 1
    STORE r10, r12            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r13, 1               ; constant 1
    LDI r6, 4               ; max channels
    LDI r4, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r10, 0xF00          ; command flag
    LDI r0, 0xF01          ; frequency
    LDI r5, 0xF02          ; duration
    LDI r9, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r12, r10            ; r12 = command flag
    JZ r12, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r2, 2
    CMP r12, r2
    JZ r8, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r2, r0            ; frequency
    LOAD r7, r5            ; duration
    LOAD r3, r9            ; channel

    ; Validate channel (0-3)
    CMP r3, r6
    BGE r8, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r12, r3              ; r12 = channel
    LDI r11, 3
    MUL r12, r11              ; r12 = channel * 3
    ADD r12, r4              ; r12 = 0x200 + channel * 3

    STORE r12, r2            ; freq at base+0
    MOV r11, r12
    ADD r11, r13
    STORE r11, r7            ; dur at base+1
    MOV r11, r12
    LDI r1, 2
    ADD r11, r1
    STORE r11, r13            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r2, r7

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r12, 0
    STORE r10, r12

    JMP mixer_loop

mixer_shutdown:
    LDI r12, 0
    STORE r10, r12
    HALT
