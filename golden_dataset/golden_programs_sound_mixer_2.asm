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
;   r5-r4 = shared RAM addresses
;   r3  = frequency
;   r7  = duration
;   r10  = channel
;
; Register convention (mixer daemon):
;   r15  = constant 1
;   r1  = constant 4 (max channels)
;   r11  = channel table base (0x200)
;   r5-r4 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r8, mixer_daemon
    SPAWN r8

    ; ── Set up shared RAM address pointers ──
    LDI r5, 0xF00          ; command flag address
    LDI r14, 0xF01          ; frequency address
    LDI r12, 0xF02          ; duration address
    LDI r4, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r3, 262
    LDI r7, 400
    LDI r10, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r3, 330
    LDI r7, 400
    LDI r10, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r3, 392
    LDI r7, 400
    LDI r10, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r3, 523
    LDI r7, 600
    LDI r10, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r3, 440
    LDI r7, 500
    LDI r10, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r0, 2               ; shutdown flag
    STORE r5, r0

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r3=freq, r7=dur, r10=channel
; Uses: r0 (scratch)
; Preserves: r3, r7, r10, r5-r4
write_note:
    PUSH r31
wait_ready:
    LOAD r0, r5            ; r0 = command flag
    JNZ r0, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r14, r3            ; frequency
    STORE r12, r7            ; duration
    STORE r4, r10            ; channel
    LDI r0, 1
    STORE r5, r0            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r15, 1               ; constant 1
    LDI r1, 4               ; max channels
    LDI r11, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r5, 0xF00          ; command flag
    LDI r14, 0xF01          ; frequency
    LDI r12, 0xF02          ; duration
    LDI r4, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r0, r5            ; r0 = command flag
    JZ r0, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r3, 2
    CMP r0, r3
    JZ r6, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r3, r14            ; frequency
    LOAD r7, r12            ; duration
    LOAD r10, r4            ; channel

    ; Validate channel (0-3)
    CMP r10, r1
    BGE r6, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r0, r10              ; r0 = channel
    LDI r8, 3
    MUL r0, r8              ; r0 = channel * 3
    ADD r0, r11              ; r0 = 0x200 + channel * 3

    STORE r0, r3            ; freq at base+0
    MOV r8, r0
    ADD r8, r15
    STORE r8, r7            ; dur at base+1
    MOV r8, r0
    LDI r9, 2
    ADD r8, r9
    STORE r8, r15            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r3, r7

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r0, 0
    STORE r5, r0

    JMP mixer_loop

mixer_shutdown:
    LDI r0, 0
    STORE r5, r0
    HALT
