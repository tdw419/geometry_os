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
;   r11-r13 = shared RAM addresses
;   r12  = frequency
;   r15  = duration
;   r5  = channel
;
; Register convention (mixer daemon):
;   r7  = constant 1
;   r3  = constant 4 (max channels)
;   r4  = channel table base (0x200)
;   r11-r13 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r14, mixer_daemon
    SPAWN r14

    ; ── Set up shared RAM address pointers ──
    LDI r11, 0xF00          ; command flag address
    LDI r0, 0xF01          ; frequency address
    LDI r6, 0xF02          ; duration address
    LDI r13, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r12, 262
    LDI r15, 400
    LDI r5, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r12, 330
    LDI r15, 400
    LDI r5, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r12, 392
    LDI r15, 400
    LDI r5, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r12, 523
    LDI r15, 600
    LDI r5, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r12, 440
    LDI r15, 500
    LDI r5, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r9, 2               ; shutdown flag
    STORE r11, r9

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r12=freq, r15=dur, r5=channel
; Uses: r9 (scratch)
; Preserves: r12, r15, r5, r11-r13
write_note:
    PUSH r31
wait_ready:
    LOAD r9, r11            ; r9 = command flag
    JNZ r9, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r0, r12            ; frequency
    STORE r6, r15            ; duration
    STORE r13, r5            ; channel
    LDI r9, 1
    STORE r11, r9            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r7, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r4, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r11, 0xF00          ; command flag
    LDI r0, 0xF01          ; frequency
    LDI r6, 0xF02          ; duration
    LDI r13, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r9, r11            ; r9 = command flag
    JZ r9, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r12, 2
    CMP r9, r12
    JZ r10, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r12, r0            ; frequency
    LOAD r15, r6            ; duration
    LOAD r5, r13            ; channel

    ; Validate channel (0-3)
    CMP r5, r3
    BGE r10, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r9, r5              ; r9 = channel
    LDI r14, 3
    MUL r9, r14              ; r9 = channel * 3
    ADD r9, r4              ; r9 = 0x200 + channel * 3

    STORE r9, r12            ; freq at base+0
    MOV r14, r9
    ADD r14, r7
    STORE r14, r15            ; dur at base+1
    MOV r14, r9
    LDI r2, 2
    ADD r14, r2
    STORE r14, r7            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r12, r15

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r9, 0
    STORE r11, r9

    JMP mixer_loop

mixer_shutdown:
    LDI r9, 0
    STORE r11, r9
    HALT
