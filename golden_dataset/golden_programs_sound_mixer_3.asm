; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
;   r9-r15 = shared RAM addresses
;   r10  = frequency
;   r8  = duration
;   r11  = channel
;
; Register convention (mixer daemon):
;   r12  = constant 1
;   r3  = constant 4 (max channels)
;   r5  = channel table base (0x200)
;   r9-r15 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r6, mixer_daemon
    SPAWN r6

    ; ── Set up shared RAM address pointers ──
    LDI r9, 0xF00          ; command flag address
    LDI r0, 0xF01          ; frequency address
    LDI r13, 0xF02          ; duration address
    LDI r15, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r10, 262
    LDI r8, 400
    LDI r11, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r10, 330
    LDI r8, 400
    LDI r11, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r10, 392
    LDI r8, 400
    LDI r11, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r10, 523
    LDI r8, 600
    LDI r11, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r10, 440
    LDI r8, 500
    LDI r11, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r14, 2               ; shutdown flag
    STORE r9, r14

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r10=freq, r8=dur, r11=channel
; Uses: r14 (scratch)
; Preserves: r10, r8, r11, r9-r15
write_note:
    PUSH r31
wait_ready:
    LOAD r14, r9            ; r14 = command flag
    JNZ r14, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r0, r10            ; frequency
    STORE r13, r8            ; duration
    STORE r15, r11            ; channel
    LDI r14, 1
    STORE r9, r14            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r12, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r5, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r9, 0xF00          ; command flag
    LDI r0, 0xF01          ; frequency
    LDI r13, 0xF02          ; duration
    LDI r15, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r14, r9            ; r14 = command flag
    JZ r14, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r10, 2
    CMP r14, r10
    JZ r1, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r10, r0            ; frequency
    LOAD r8, r13            ; duration
    LOAD r11, r15            ; channel

    ; Validate channel (0-3)
    CMP r11, r3
    BGE r1, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r14, r11              ; r14 = channel
    LDI r6, 3
    MUL r14, r6              ; r14 = channel * 3
    ADD r14, r5              ; r14 = 0x200 + channel * 3

    STORE r14, r10            ; freq at base+0
    MOV r6, r14
    ADD r6, r12
    STORE r6, r8            ; dur at base+1
    MOV r6, r14
    LDI r4, 2
    ADD r6, r4
    STORE r6, r12            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r10, r8

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r14, 0
    STORE r9, r14

    JMP mixer_loop

mixer_shutdown:
    LDI r14, 0
    STORE r9, r14
    HALT
