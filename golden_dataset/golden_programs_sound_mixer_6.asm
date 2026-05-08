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
;   r12-r7 = shared RAM addresses
;   r4  = frequency
;   r9  = duration
;   r13  = channel
;
; Register convention (mixer daemon):
;   r1  = constant 1
;   r3  = constant 4 (max channels)
;   r0  = channel table base (0x200)
;   r12-r7 = shared RAM addresses

; ── Parent Process (Music Player) ────────────────────────────────
    LDI r30, 0xFF00         ; stack pointer

    ; ── Spawn mixer daemon ──
    LDI r2, mixer_daemon
    SPAWN r2

    ; ── Set up shared RAM address pointers ──
    LDI r12, 0xF00          ; command flag address
    LDI r6, 0xF01          ; frequency address
    LDI r15, 0xF02          ; duration address
    LDI r7, 0xF03          ; channel address

    ; ── Play melody via shared RAM ──
    ; Helper: write_note(freq, dur, channel) - polls until mixer is ready

    ; Note 1: C4 (262 Hz) on channel 0
    LDI r4, 262
    LDI r9, 400
    LDI r13, 0
    CALL write_note

    ; Note 2: E4 (330 Hz) on channel 1
    LDI r4, 330
    LDI r9, 400
    LDI r13, 1
    CALL write_note

    ; Note 3: G4 (392 Hz) on channel 0
    LDI r4, 392
    LDI r9, 400
    LDI r13, 0
    CALL write_note

    ; Note 4: C5 (523 Hz) on channel 2
    LDI r4, 523
    LDI r9, 600
    LDI r13, 2
    CALL write_note

    ; Note 5: A4 (440 Hz) on channel 3
    LDI r4, 440
    LDI r9, 500
    LDI r13, 3
    CALL write_note

    ; ── Send shutdown command ──
    LDI r14, 2               ; shutdown flag
    STORE r12, r14

    HALT

; ── write_note subroutine ───────────────────────────────────────
; Sends a note to the mixer via shared RAM
; Input: r4=freq, r9=dur, r13=channel
; Uses: r14 (scratch)
; Preserves: r4, r9, r13, r12-r7
write_note:
    PUSH r31
wait_ready:
    LOAD r14, r12            ; r14 = command flag
    JNZ r14, wait_ready      ; wait until mixer clears previous command

    ; Write note data to shared RAM
    STORE r6, r4            ; frequency
    STORE r15, r9            ; duration
    STORE r7, r13            ; channel
    LDI r14, 1
    STORE r12, r14            ; set command flag = 1

    POP r31
    RET

; ── Mixer Daemon (child process at page-aligned 0x400) ──────────
.org 0x400
mixer_daemon:
    LDI r30, 0xFF00         ; stack pointer
    LDI r1, 1               ; constant 1
    LDI r3, 4               ; max channels
    LDI r0, 0x200           ; channel table base

    ; Set up shared RAM address pointers
    LDI r12, 0xF00          ; command flag
    LDI r6, 0xF01          ; frequency
    LDI r15, 0xF02          ; duration
    LDI r7, 0xF03          ; channel

mixer_loop:
    ; Poll for commands
    LOAD r14, r12            ; r14 = command flag
    JZ r14, mixer_loop       ; no command, keep polling

    ; Check for shutdown (command == 2)
    LDI r4, 2
    CMP r14, r4
    JZ r5, mixer_shutdown

    ; Command == 1: play note
    ; Read note data from shared RAM
    LOAD r4, r6            ; frequency
    LOAD r9, r15            ; duration
    LOAD r13, r7            ; channel

    ; Validate channel (0-3)
    CMP r13, r3
    BGE r5, clear_cmd       ; invalid channel, skip

    ; Store in channel table
    ; offset = channel * 3, base = 0x200
    MOV r14, r13              ; r14 = channel
    LDI r2, 3
    MUL r14, r2              ; r14 = channel * 3
    ADD r14, r0              ; r14 = 0x200 + channel * 3

    STORE r14, r4            ; freq at base+0
    MOV r2, r14
    ADD r2, r1
    STORE r2, r9            ; dur at base+1
    MOV r2, r14
    LDI r10, 2
    ADD r2, r10
    STORE r2, r1            ; active = 1 at base+2

    ; Play the note via BEEP
    BEEP r4, r9

clear_cmd:
    ; Clear command flag so parent can send next note
    LDI r14, 0
    STORE r12, r14

    JMP mixer_loop

mixer_shutdown:
    LDI r14, 0
    STORE r12, r14
    HALT
