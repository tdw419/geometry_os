; DESCRIPTION: This GeOS assembly code implements a layered sound effects demo that simulates audio mixing by playing overlapping BEEP and NOTE calls. It features a walking rhythm with low thuds and an ambient tone overlay, controlled via keyboard inputs for tempo adjustment and waveform changes, with visual indicators on the screen.

; sfx_mixer.asm -- Layered Sound Effects Demo
; Demonstrates overlapping BEEP and NOTE calls to simulate audio mixing.
; Plays a walking rhythm (low thuds) with an ambient tone overlay.
; Uses FRAME for animation loop, IKEY for interaction.
;
; Controls:
;   W/S - increase/decrease tempo
;   A/D - change ambient waveform (sine/square/triangle/sawtooth)
;   Q   - quit
;
; Memory map:
;   0x2400 tempo (frames between steps, default 15)
;   0x2404 ambient_wave (0=sine, 1=square, 2=triangle, 3=sawtooth)
;   0x2408 step_phase (0=left, 1=right foot)
;   0x240C frame_counter

; ── Init ───────────────────────────────────────────────────────
LDI r1, 15
LDI r4, 0x2400
STORE r4, r1           ; tempo = 15 frames between steps

LDI r1, 0
LDI r4, 0x2404
STORE r4, r1           ; ambient_wave = 0 (sine)

LDI r1, 0
LDI r4, 0x2408
STORE r4, r1           ; step_phase = 0 (left foot)

LDI r1, 0
LDI r4, 0x240C
STORE r4, r1           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r1, 0x000000
FILL r1                ; clear screen black

LDI r1, 0x00FF00
LDI r10, 80
LDI r11, 20
LDI r4, 0x2500
LDI r1, 83             ; 'S'
STORE r4, r1
ADD r4, r7
LDI r1, 70             ; 'F'
STORE r4, r1
ADD r4, r7
LDI r1, 88             ; 'X'
STORE r4, r1
ADD r4, r7
LDI r1, 95             ; '_'
STORE r4, r1
ADD r4, r7
LDI r1, 77             ; 'M'
STORE r4, r1
ADD r4, r7
LDI r1, 73             ; 'I'
STORE r4, r1
ADD r4, r7
LDI r1, 88             ; 'X'
STORE r4, r1
ADD r4, r7
LDI r1, 69             ; 'E'
STORE r4, r1
ADD r4, r7
LDI r1, 82             ; 'R'
STORE r4, r1
ADD r4, r7
LDI r1, 0              ; null terminator
STORE r4, r1
LDI r4, 0x2500
TEXT r10, r11, r4

; Instructions
LDI r4, 0x2520
LDI r1, 87
STORE r4, r1
ADD r4, r7
LDI r1, 47
STORE r4, r1
ADD r4, r7
LDI r1, 83
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 61
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 84
STORE r4, r1
ADD r4, r7
LDI r1, 69
STORE r4, r1
ADD r4, r7
LDI r1, 77
STORE r4, r1
ADD r4, r7
LDI r1, 80
STORE r4, r1
ADD r4, r7
LDI r1, 79
STORE r4, r1
ADD r4, r7
LDI r1, 0
STORE r4, r1
LDI r10, 80
LDI r11, 40
LDI r4, 0x2520
TEXT r10, r11, r4

; A/D line
LDI r4, 0x2540
LDI r1, 65
STORE r4, r1
ADD r4, r7
LDI r1, 47
STORE r4, r1
ADD r4, r7
LDI r1, 68
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 61
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 87
STORE r4, r1
ADD r4, r7
LDI r1, 65
STORE r4, r1
ADD r4, r7
LDI r1, 86
STORE r4, r1
ADD r4, r7
LDI r1, 69
STORE r4, r1
ADD r4, r7
LDI r1, 0
STORE r4, r1
LDI r10, 80
LDI r11, 50
LDI r4, 0x2540
TEXT r10, r11, r4

; Q line
LDI r4, 0x2560
LDI r1, 81
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 61
STORE r4, r1
ADD r4, r7
LDI r1, 32
STORE r4, r1
ADD r4, r7
LDI r1, 81
STORE r4, r1
ADD r4, r7
LDI r1, 85
STORE r4, r1
ADD r4, r7
LDI r1, 73
STORE r4, r1
ADD r4, r7
LDI r1, 84
STORE r4, r1
ADD r4, r7
LDI r1, 0
STORE r4, r1
LDI r10, 80
LDI r11, 60
LDI r4, 0x2560
TEXT r10, r11, r4

; ── Main Loop ──────────────────────────────────────────────────
LDI r7, 1              ; constant 1
LDI r8, 0xFFE          ; TICKS port
LDI r9, 0x2400         ; tempo addr
LDI r12, 0x2404        ; ambient_wave addr
LDI r13, 0x2408        ; step_phase addr
LDI r14, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r1, 0x000000
    FILL r1            ; clear screen

    ; Increment frame counter
    LDI r4, 0x240C
    LDI r1, 0
    LOAD r1, r4
    ADD r1, r7
    STORE r4, r1

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r15            ; r15 = key (0 if none)

    ; Q = quit
    LDI r1, 81
    CMP r15, r1
    JZ r0, do_quit

    ; W = increase tempo (decrease delay)
    LDI r1, 87
    CMP r15, r1
    JZ r0, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r1, 83
    CMP r15, r1
    JZ r0, tempo_down

    ; A = prev waveform
    LDI r1, 65
    CMP r15, r1
    JZ r0, wave_prev

    ; D = next waveform
    LDI r1, 68
    CMP r15, r1
    JZ r0, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r4, 0x2400
    LDI r1, 0
    LOAD r1, r4
    LDI r2, 5
    CMP r1, r2
    BLT r0, check_step  ; min tempo = 5
    LDI r2, 2
    SUB r1, r2
    STORE r4, r1
    JMP check_step

tempo_down:
    LDI r4, 0x2400
    LDI r1, 0
    LOAD r1, r4
    LDI r2, 60
    CMP r1, r2
    BGE r0, check_step  ; max tempo = 60
    LDI r2, 2
    ADD r1, r2
    STORE r4, r1
    JMP check_step

wave_prev:
    LDI r4, 0x2404
    LDI r1, 0
    LOAD r1, r4
    JZ r1, check_step  ; already at 0
    LDI r2, 1
    SUB r1, r2
    STORE r4, r1
    JMP check_step

wave_next:
    LDI r4, 0x2404
    LDI r1, 0
    LOAD r1, r4
    LDI r2, 3
    CMP r1, r2
    BGE r0, check_step ; max wave = 3 (sawtooth)
    LDI r2, 1
    ADD r1, r2
    STORE r4, r1
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r15, r8
    ; Read tempo
    LDI r4, 0x2400
    LDI r1, 0
    LOAD r1, r4
    ; ticks % tempo
    MOV r2, r15
    LDI r3, 0
    CMP r1, r3
    JZ r0, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r2 = ticks % tempo, check if 0
    JZ r2, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r4, 0x2408
    LDI r1, 0
    LOAD r1, r4         ; r1 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r1, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r1, 120
    LDI r2, 40
    BEEP r1, r2
    JMP toggle_phase

left_foot:
    LDI r1, 80
    LDI r2, 50
    BEEP r1, r2

toggle_phase:
    LDI r4, 0x2408
    LDI r1, 0
    LOAD r1, r4
    LDI r2, 1
    XOR r1, r2          ; toggle 0<->1
    STORE r4, r1

    ; Draw step indicator
    LDI r1, 0x2408
    LDI r3, 0
    LOAD r3, r1         ; r3 = phase
    LDI r1, 0xFF4444    ; red dot for left
    LDI r4, 0x44FF44    ; green dot for right
    JZ r3, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r15, r14       ; r15 = frame_counter
    LDI r1, 120
    CALL mod16          ; r2 = frame_counter % 120
    JZ r2, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r4, 0x2404
    LDI r1, 0
    LOAD r1, r4         ; r1 = waveform type

    LDI r2, 220         ; A3 = 220Hz
    LDI r3, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r1=wave, r2=freq, r3=dur already set
    NOTE r1, r2, r3

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r4, 0x2400
    LDI r1, 0
    LOAD r1, r4         ; r1 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r10, 20
    LDI r11, 100
    MOV r12, r1
    LDI r3, 3
    MUL r12, r3         ; r12 = tempo * 3 (bar width)
    LDI r13, 30         ; bar height
    LDI r9, 0x336699    ; steel blue
    RECTF r10, r11, r12, r13, r9

    ; Tempo label
    LDI r4, 0x2580
    LDI r1, 84
    STORE r4, r1
    ADD r4, r7
    LDI r1, 58
    STORE r4, r1
    ADD r4, r7
    LDI r1, 77
    STORE r4, r1
    ADD r4, r7
    LDI r1, 80
    STORE r4, r1
    ADD r4, r7
    LDI r1, 79
    STORE r4, r1
    ADD r4, r7
    LDI r1, 58
    STORE r4, r1
    ADD r4, r7
    LDI r1, 0
    STORE r4, r1
    LDI r10, 20
    LDI r11, 140
    LDI r4, 0x2580
    TEXT r10, r11, r4

    ; Waveform indicator
    LDI r4, 0x2404
    LDI r1, 0
    LOAD r1, r4         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r1, wave_sine
    LDI r2, 1
    CMP r1, r2
    JZ r0, wave_square
    LDI r2, 2
    CMP r1, r2
    JZ r0, wave_triangle
    JMP wave_saw

wave_sine:
    PSETI 200, 90, 0x00FFFF
    JMP hud_done

wave_square:
    PSETI 200, 90, 0xFFFF00
    JMP hud_done

wave_triangle:
    PSETI 200, 90, 0xFF00FF
    JMP hud_done

wave_saw:
    PSETI 200, 90, 0xFF8800
    JMP hud_done

hud_done:
    JMP main_loop

    ; ── Helper: mod16 (r2 = r15 % r1) ─────────────────────────
    ; r15 = dividend, r1 = divisor
    ; Returns r2 = remainder
    ; Clobbers r5, r6
mod16:
    PUSH r31
    PUSH r1
    PUSH r5
    PUSH r6
    MOV r2, r15
    MOV r5, r1          ; r5 = divisor
    LDI r6, 0           ; r6 = quotient
mod_loop:
    CMP r2, r5
    BLT r0, mod_done
    SUB r2, r5
    ADD r6, r7
    JMP mod_loop
mod_done:
    POP r6
    POP r5
    POP r1
    POP r31
    RET
