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
LDI r5, 15
LDI r13, 0x2400
STORE r13, r5           ; tempo = 15 frames between steps

LDI r5, 0
LDI r13, 0x2404
STORE r13, r5           ; ambient_wave = 0 (sine)

LDI r5, 0
LDI r13, 0x2408
STORE r13, r5           ; step_phase = 0 (left foot)

LDI r5, 0
LDI r13, 0x240C
STORE r13, r5           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r5, 0x000000
FILL r5                ; clear screen black

LDI r5, 0x00FF00
LDI r11, 80
LDI r3, 20
LDI r13, 0x2500
LDI r5, 83             ; 'S'
STORE r13, r5
ADD r13, r9
LDI r5, 70             ; 'F'
STORE r13, r5
ADD r13, r9
LDI r5, 88             ; 'X'
STORE r13, r5
ADD r13, r9
LDI r5, 95             ; '_'
STORE r13, r5
ADD r13, r9
LDI r5, 77             ; 'M'
STORE r13, r5
ADD r13, r9
LDI r5, 73             ; 'I'
STORE r13, r5
ADD r13, r9
LDI r5, 88             ; 'X'
STORE r13, r5
ADD r13, r9
LDI r5, 69             ; 'E'
STORE r13, r5
ADD r13, r9
LDI r5, 82             ; 'R'
STORE r13, r5
ADD r13, r9
LDI r5, 0              ; null terminator
STORE r13, r5
LDI r13, 0x2500
TEXT r11, r3, r13

; Instructions
LDI r13, 0x2520
LDI r5, 87
STORE r13, r5
ADD r13, r9
LDI r5, 47
STORE r13, r5
ADD r13, r9
LDI r5, 83
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 61
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 84
STORE r13, r5
ADD r13, r9
LDI r5, 69
STORE r13, r5
ADD r13, r9
LDI r5, 77
STORE r13, r5
ADD r13, r9
LDI r5, 80
STORE r13, r5
ADD r13, r9
LDI r5, 79
STORE r13, r5
ADD r13, r9
LDI r5, 0
STORE r13, r5
LDI r11, 80
LDI r3, 40
LDI r13, 0x2520
TEXT r11, r3, r13

; A/D line
LDI r13, 0x2540
LDI r5, 65
STORE r13, r5
ADD r13, r9
LDI r5, 47
STORE r13, r5
ADD r13, r9
LDI r5, 68
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 61
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 87
STORE r13, r5
ADD r13, r9
LDI r5, 65
STORE r13, r5
ADD r13, r9
LDI r5, 86
STORE r13, r5
ADD r13, r9
LDI r5, 69
STORE r13, r5
ADD r13, r9
LDI r5, 0
STORE r13, r5
LDI r11, 80
LDI r3, 50
LDI r13, 0x2540
TEXT r11, r3, r13

; Q line
LDI r13, 0x2560
LDI r5, 81
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 61
STORE r13, r5
ADD r13, r9
LDI r5, 32
STORE r13, r5
ADD r13, r9
LDI r5, 81
STORE r13, r5
ADD r13, r9
LDI r5, 85
STORE r13, r5
ADD r13, r9
LDI r5, 73
STORE r13, r5
ADD r13, r9
LDI r5, 84
STORE r13, r5
ADD r13, r9
LDI r5, 0
STORE r13, r5
LDI r11, 80
LDI r3, 60
LDI r13, 0x2560
TEXT r11, r3, r13

; ── Main Loop ──────────────────────────────────────────────────
LDI r9, 1              ; constant 1
LDI r7, 0xFFE          ; TICKS port
LDI r2, 0x2400         ; tempo addr
LDI r12, 0x2404        ; ambient_wave addr
LDI r10, 0x2408        ; step_phase addr
LDI r8, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r5, 0x000000
    FILL r5            ; clear screen

    ; Increment frame counter
    LDI r13, 0x240C
    LDI r5, 0
    LOAD r5, r13
    ADD r5, r9
    STORE r13, r5

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r0            ; r0 = key (0 if none)

    ; Q = quit
    LDI r5, 81
    CMP r0, r5
    JZ r1, do_quit

    ; W = increase tempo (decrease delay)
    LDI r5, 87
    CMP r0, r5
    JZ r1, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r5, 83
    CMP r0, r5
    JZ r1, tempo_down

    ; A = prev waveform
    LDI r5, 65
    CMP r0, r5
    JZ r1, wave_prev

    ; D = next waveform
    LDI r5, 68
    CMP r0, r5
    JZ r1, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r13, 0x2400
    LDI r5, 0
    LOAD r5, r13
    LDI r6, 5
    CMP r5, r6
    BLT r1, check_step  ; min tempo = 5
    LDI r6, 2
    SUB r5, r6
    STORE r13, r5
    JMP check_step

tempo_down:
    LDI r13, 0x2400
    LDI r5, 0
    LOAD r5, r13
    LDI r6, 60
    CMP r5, r6
    BGE r1, check_step  ; max tempo = 60
    LDI r6, 2
    ADD r5, r6
    STORE r13, r5
    JMP check_step

wave_prev:
    LDI r13, 0x2404
    LDI r5, 0
    LOAD r5, r13
    JZ r5, check_step  ; already at 0
    LDI r6, 1
    SUB r5, r6
    STORE r13, r5
    JMP check_step

wave_next:
    LDI r13, 0x2404
    LDI r5, 0
    LOAD r5, r13
    LDI r6, 3
    CMP r5, r6
    BGE r1, check_step ; max wave = 3 (sawtooth)
    LDI r6, 1
    ADD r5, r6
    STORE r13, r5
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r0, r7
    ; Read tempo
    LDI r13, 0x2400
    LDI r5, 0
    LOAD r5, r13
    ; ticks % tempo
    MOV r6, r0
    LDI r4, 0
    CMP r5, r4
    JZ r1, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r6 = ticks % tempo, check if 0
    JZ r6, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r13, 0x2408
    LDI r5, 0
    LOAD r5, r13         ; r5 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r5, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r5, 120
    LDI r6, 40
    BEEP r5, r6
    JMP toggle_phase

left_foot:
    LDI r5, 80
    LDI r6, 50
    BEEP r5, r6

toggle_phase:
    LDI r13, 0x2408
    LDI r5, 0
    LOAD r5, r13
    LDI r6, 1
    XOR r5, r6          ; toggle 0<->1
    STORE r13, r5

    ; Draw step indicator
    LDI r5, 0x2408
    LDI r4, 0
    LOAD r4, r5         ; r4 = phase
    LDI r5, 0xFF4444    ; red dot for left
    LDI r13, 0x44FF44    ; green dot for right
    JZ r4, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r0, r8       ; r0 = frame_counter
    LDI r5, 120
    CALL mod16          ; r6 = frame_counter % 120
    JZ r6, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r13, 0x2404
    LDI r5, 0
    LOAD r5, r13         ; r5 = waveform type

    LDI r6, 220         ; A3 = 220Hz
    LDI r4, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r5=wave, r6=freq, r4=dur already set
    NOTE r5, r6, r4

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r13, 0x2400
    LDI r5, 0
    LOAD r5, r13         ; r5 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r11, 20
    LDI r3, 100
    MOV r12, r5
    LDI r4, 3
    MUL r12, r4         ; r12 = tempo * 3 (bar width)
    LDI r10, 30         ; bar height
    LDI r2, 0x336699    ; steel blue
    RECTF r11, r3, r12, r10, r2

    ; Tempo label
    LDI r13, 0x2580
    LDI r5, 84
    STORE r13, r5
    ADD r13, r9
    LDI r5, 58
    STORE r13, r5
    ADD r13, r9
    LDI r5, 77
    STORE r13, r5
    ADD r13, r9
    LDI r5, 80
    STORE r13, r5
    ADD r13, r9
    LDI r5, 79
    STORE r13, r5
    ADD r13, r9
    LDI r5, 58
    STORE r13, r5
    ADD r13, r9
    LDI r5, 0
    STORE r13, r5
    LDI r11, 20
    LDI r3, 140
    LDI r13, 0x2580
    TEXT r11, r3, r13

    ; Waveform indicator
    LDI r13, 0x2404
    LDI r5, 0
    LOAD r5, r13         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r5, wave_sine
    LDI r6, 1
    CMP r5, r6
    JZ r1, wave_square
    LDI r6, 2
    CMP r5, r6
    JZ r1, wave_triangle
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

    ; ── Helper: mod16 (r6 = r0 % r5) ─────────────────────────
    ; r0 = dividend, r5 = divisor
    ; Returns r6 = remainder
    ; Clobbers r15, r14
mod16:
    PUSH r31
    PUSH r5
    PUSH r15
    PUSH r14
    MOV r6, r0
    MOV r15, r5          ; r15 = divisor
    LDI r14, 0           ; r14 = quotient
mod_loop:
    CMP r6, r15
    BLT r1, mod_done
    SUB r6, r15
    ADD r14, r9
    JMP mod_loop
mod_done:
    POP r14
    POP r15
    POP r5
    POP r31
    RET
