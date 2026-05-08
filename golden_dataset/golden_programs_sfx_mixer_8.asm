; DESCRIPTION: Render a red object at the screen.

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
LDI r6, 15
LDI r7, 0x2400
STORE r7, r6           ; tempo = 15 frames between steps

LDI r6, 0
LDI r7, 0x2404
STORE r7, r6           ; ambient_wave = 0 (sine)

LDI r6, 0
LDI r7, 0x2408
STORE r7, r6           ; step_phase = 0 (left foot)

LDI r6, 0
LDI r7, 0x240C
STORE r7, r6           ; frame_counter = 0

; ── Draw title screen ──────────────────────────────────────────
LDI r6, 0x000000
FILL r6                ; clear screen black

LDI r6, 0x00FF00
LDI r2, 80
LDI r14, 20
LDI r7, 0x2500
LDI r6, 83             ; 'S'
STORE r7, r6
ADD r7, r10
LDI r6, 70             ; 'F'
STORE r7, r6
ADD r7, r10
LDI r6, 88             ; 'X'
STORE r7, r6
ADD r7, r10
LDI r6, 95             ; '_'
STORE r7, r6
ADD r7, r10
LDI r6, 77             ; 'M'
STORE r7, r6
ADD r7, r10
LDI r6, 73             ; 'I'
STORE r7, r6
ADD r7, r10
LDI r6, 88             ; 'X'
STORE r7, r6
ADD r7, r10
LDI r6, 69             ; 'E'
STORE r7, r6
ADD r7, r10
LDI r6, 82             ; 'R'
STORE r7, r6
ADD r7, r10
LDI r6, 0              ; null terminator
STORE r7, r6
LDI r7, 0x2500
TEXT r2, r14, r7

; Instructions
LDI r7, 0x2520
LDI r6, 87
STORE r7, r6
ADD r7, r10
LDI r6, 47
STORE r7, r6
ADD r7, r10
LDI r6, 83
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 61
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 84
STORE r7, r6
ADD r7, r10
LDI r6, 69
STORE r7, r6
ADD r7, r10
LDI r6, 77
STORE r7, r6
ADD r7, r10
LDI r6, 80
STORE r7, r6
ADD r7, r10
LDI r6, 79
STORE r7, r6
ADD r7, r10
LDI r6, 0
STORE r7, r6
LDI r2, 80
LDI r14, 40
LDI r7, 0x2520
TEXT r2, r14, r7

; A/D line
LDI r7, 0x2540
LDI r6, 65
STORE r7, r6
ADD r7, r10
LDI r6, 47
STORE r7, r6
ADD r7, r10
LDI r6, 68
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 61
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 87
STORE r7, r6
ADD r7, r10
LDI r6, 65
STORE r7, r6
ADD r7, r10
LDI r6, 86
STORE r7, r6
ADD r7, r10
LDI r6, 69
STORE r7, r6
ADD r7, r10
LDI r6, 0
STORE r7, r6
LDI r2, 80
LDI r14, 50
LDI r7, 0x2540
TEXT r2, r14, r7

; Q line
LDI r7, 0x2560
LDI r6, 81
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 61
STORE r7, r6
ADD r7, r10
LDI r6, 32
STORE r7, r6
ADD r7, r10
LDI r6, 81
STORE r7, r6
ADD r7, r10
LDI r6, 85
STORE r7, r6
ADD r7, r10
LDI r6, 73
STORE r7, r6
ADD r7, r10
LDI r6, 84
STORE r7, r6
ADD r7, r10
LDI r6, 0
STORE r7, r6
LDI r2, 80
LDI r14, 60
LDI r7, 0x2560
TEXT r2, r14, r7

; ── Main Loop ──────────────────────────────────────────────────
LDI r10, 1              ; constant 1
LDI r8, 0xFFE          ; TICKS port
LDI r12, 0x2400         ; tempo addr
LDI r13, 0x2404        ; ambient_wave addr
LDI r0, 0x2408        ; step_phase addr
LDI r9, 0x240C        ; frame_counter addr

main_loop:
    FRAME
    LDI r6, 0x000000
    FILL r6            ; clear screen

    ; Increment frame counter
    LDI r7, 0x240C
    LDI r6, 0
    LOAD r6, r7
    ADD r6, r10
    STORE r7, r6

    ; ── Read keyboard ──────────────────────────────────────────
    IKEY r11            ; r11 = key (0 if none)

    ; Q = quit
    LDI r6, 81
    CMP r11, r6
    JZ r15, do_quit

    ; W = increase tempo (decrease delay)
    LDI r6, 87
    CMP r11, r6
    JZ r15, tempo_up

    ; S = decrease tempo (increase delay)
    LDI r6, 83
    CMP r11, r6
    JZ r15, tempo_down

    ; A = prev waveform
    LDI r6, 65
    CMP r11, r6
    JZ r15, wave_prev

    ; D = next waveform
    LDI r6, 68
    CMP r11, r6
    JZ r15, wave_next

    JMP check_step

do_quit:
    HALT

tempo_up:
    LDI r7, 0x2400
    LDI r6, 0
    LOAD r6, r7
    LDI r4, 5
    CMP r6, r4
    BLT r15, check_step  ; min tempo = 5
    LDI r4, 2
    SUB r6, r4
    STORE r7, r6
    JMP check_step

tempo_down:
    LDI r7, 0x2400
    LDI r6, 0
    LOAD r6, r7
    LDI r4, 60
    CMP r6, r4
    BGE r15, check_step  ; max tempo = 60
    LDI r4, 2
    ADD r6, r4
    STORE r7, r6
    JMP check_step

wave_prev:
    LDI r7, 0x2404
    LDI r6, 0
    LOAD r6, r7
    JZ r6, check_step  ; already at 0
    LDI r4, 1
    SUB r6, r4
    STORE r7, r6
    JMP check_step

wave_next:
    LDI r7, 0x2404
    LDI r6, 0
    LOAD r6, r7
    LDI r4, 3
    CMP r6, r4
    BGE r15, check_step ; max wave = 3 (sawtooth)
    LDI r4, 1
    ADD r6, r4
    STORE r7, r6
    JMP check_step

    ; ── Step Logic ─────────────────────────────────────────────
check_step:
    ; Read TICKS
    LOAD r11, r8
    ; Read tempo
    LDI r7, 0x2400
    LDI r6, 0
    LOAD r6, r7
    ; ticks % tempo
    MOV r4, r11
    LDI r3, 0
    CMP r6, r3
    JZ r15, do_step      ; tempo=0 means step every frame
    CALL mod16
    ; r4 = ticks % tempo, check if 0
    JZ r4, do_step
    JMP do_ambient

do_step:
    ; Play footstep BEEP
    LDI r7, 0x2408
    LDI r6, 0
    LOAD r6, r7         ; r6 = step_phase (0=left, 1=right)

    ; Left foot: 80Hz thud, 50ms
    JZ r6, left_foot

    ; Right foot: 120Hz thud, 40ms
    LDI r6, 120
    LDI r4, 40
    BEEP r6, r4
    JMP toggle_phase

left_foot:
    LDI r6, 80
    LDI r4, 50
    BEEP r6, r4

toggle_phase:
    LDI r7, 0x2408
    LDI r6, 0
    LOAD r6, r7
    LDI r4, 1
    XOR r6, r4          ; toggle 0<->1
    STORE r7, r6

    ; Draw step indicator
    LDI r6, 0x2408
    LDI r3, 0
    LOAD r3, r6         ; r3 = phase
    LDI r6, 0xFF4444    ; red dot for left
    LDI r7, 0x44FF44    ; green dot for right
    JZ r3, draw_left
    PSETI 140, 90, 0x44FF44
    JMP do_ambient

draw_left:
    PSETI 140, 90, 0xFF4444

    ; ── Ambient Tone ───────────────────────────────────────────
do_ambient:
    ; Play ambient NOTE every 120 frames
    LOAD r11, r9       ; r11 = frame_counter
    LDI r6, 120
    CALL mod16          ; r4 = frame_counter % 120
    JZ r4, play_ambient
    JMP draw_hud

play_ambient:
    ; NOTE wave_reg, freq_reg, dur_reg
    ; Read ambient wave from 0x2404
    LDI r7, 0x2404
    LDI r6, 0
    LOAD r6, r7         ; r6 = waveform type

    LDI r4, 220         ; A3 = 220Hz
    LDI r3, 200         ; 200ms

    ; NOTE opcode: 0x7E, wave_reg, freq_reg, dur_reg
    ; We need to set regs and emit the opcode via RAM
    ; Actually NOTE is an opcode, use it directly
    ; But assembler handles NOTE as a mnemonic
    ; r6=wave, r4=freq, r3=dur already set
    NOTE r6, r4, r3

    ; ── Draw HUD ───────────────────────────────────────────────
draw_hud:
    ; Draw tempo bar
    LDI r7, 0x2400
    LDI r6, 0
    LOAD r6, r7         ; r6 = tempo
    ; Bar at y=100, width = tempo * 3
    LDI r2, 20
    LDI r14, 100
    MOV r13, r6
    LDI r3, 3
    MUL r13, r3         ; r13 = tempo * 3 (bar width)
    LDI r0, 30         ; bar height
    LDI r12, 0x336699    ; steel blue
    RECTF r2, r14, r13, r0, r12

    ; Tempo label
    LDI r7, 0x2580
    LDI r6, 84
    STORE r7, r6
    ADD r7, r10
    LDI r6, 58
    STORE r7, r6
    ADD r7, r10
    LDI r6, 77
    STORE r7, r6
    ADD r7, r10
    LDI r6, 80
    STORE r7, r6
    ADD r7, r10
    LDI r6, 79
    STORE r7, r6
    ADD r7, r10
    LDI r6, 58
    STORE r7, r6
    ADD r7, r10
    LDI r6, 0
    STORE r7, r6
    LDI r2, 20
    LDI r14, 140
    LDI r7, 0x2580
    TEXT r2, r14, r7

    ; Waveform indicator
    LDI r7, 0x2404
    LDI r6, 0
    LOAD r6, r7         ; waveform type
    ; Draw colored rectangle for current wave
    ; 0=sine(cyan), 1=square(yellow), 2=triangle(magenta), 3=sawtooth(orange)
    JZ r6, wave_sine
    LDI r4, 1
    CMP r6, r4
    JZ r15, wave_square
    LDI r4, 2
    CMP r6, r4
    JZ r15, wave_triangle
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

    ; ── Helper: mod16 (r4 = r11 % r6) ─────────────────────────
    ; r11 = dividend, r6 = divisor
    ; Returns r4 = remainder
    ; Clobbers r5, r1
mod16:
    PUSH r31
    PUSH r6
    PUSH r5
    PUSH r1
    MOV r4, r11
    MOV r5, r6          ; r5 = divisor
    LDI r1, 0           ; r1 = quotient
mod_loop:
    CMP r4, r5
    BLT r15, mod_done
    SUB r4, r5
    ADD r1, r10
    JMP mod_loop
mod_done:
    POP r1
    POP r5
    POP r6
    POP r31
    RET
