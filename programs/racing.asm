; racing.asm -- Top-Down Racing Game for Geometry OS
; Controls:
;   W - Accelerate forward
;   S - Brake / Reverse
;   A - Steer left
;   D - Steer right
;   R - Restart game
;
; Layout: Rectangular track with rounded driving surface
;   Outer wall: red at x=10..25, y=10..25, x=231..246, y=231..246
;   Track surface: green, x=25..231, y=25..231
;   Inner area: black, x=45..211, y=45..211
;   Finish line: white strip at y=25, x=25..45 (bottom of top wall)
;   Drivable track: 20px wide on all 4 sides
;
; Memory layout:
;   0x3000  car_x        (integer 0-255)
;   0x3001  car_y        (integer 0-255)
;   0x3002  car_angle    (0-255, 0=up, 64=right, 128=down, 192=left)
;   0x3003  car_speed    (0..5, unsigned)
;   0x3004  lap_count
;   0x3005  lap_state    (0=outside finish zone, 1=crossed forward)
;   0x3006  timer_lo     (frame counter low)
;   0x3007  timer_hi     (frame counter high)
;   0x3008  game_state   (0=play, 1=crashed, 2=finished)
;   0x3009  crash_timer  (countdown after crash)
;   0x300A  total_laps   (target laps, set to 3)
;   0x300B  car_display_x (drawing coord x)
;   0x300C  car_display_y (drawing coord y)
;   0x3100  text_buf[0..15] (text buffer for lap/time display)
;   0x4000-0x40FF  Sine table (256 words, triangle -126..+126)

; ── Entry Point ──────────────────────────────────────────────────
restart:
  LDI r30, 0xFC00            ; stack pointer
  PUSH r31
  CALL build_sine
  POP r31
  PUSH r31
  CALL init_game
  POP r31
  JMP game_loop

; ── Sine Table (triangle wave -126..+126) ──────────────────────
; sin[0]=0, sin[64]=127, sin[128]=0, sin[192]=-127
build_sine:
  LDI r20, 0x4000             ; sine table base
  LDI r10, 0                  ; index
sin_lp:
  CMPI r10, 64
  BLT r0, sq01                ; 0-63: ramp up
  CMPI r10, 192
  BLT r0, sq23                ; 64-191: ramp down
  ; 192-255: ramp from -126 toward 0
  LDI r19, 256
  SUB r19, r10
  SHLI r19, 1
  NEG r19
  JMP sin_st
sq23:
  ; 64-191: ramp from 126 down to -126
  LDI r19, 128
  SUB r19, r10
  SHLI r19, 1
  JMP sin_st
sq01:
  ; 0-63: ramp from 0 to 126
  MOV r19, r10
  SHLI r19, 1
sin_st:
  MOV r21, r20
  ADD r21, r10
  STORE r21, r19
  ADDI r10, 1
  CMPI r10, 256
  BLT r0, sin_lp
  RET

; ── Init Game ──────────────────────────────────────────────────
init_game:
  ; Car position
  LDI r4, 0x3000
  LDI r1, 128                  ; car_x = 128
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 35                   ; car_y = 35 (just below top wall)
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 64                   ; car_angle = 64 (facing right)
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; car_speed = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; lap_count = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; lap_state = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; timer_lo = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; timer_hi = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; game_state = 0 (playing)
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; crash_timer = 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 3                    ; total_laps = 3
  STORE r4, r1
  RET

; ── Draw Track ─────────────────────────────────────────────────
; Track layout (draw once per frame):
;   Outer red wall: RECTF 10, 10, 236, 236, red
;   Track surface:  RECTF 25, 25, 206, 206, green
;   Inner void:     RECTF 45, 45, 166, 166, black
;   Finish line:    RECTF 25, 23, 20, 4, 0xFFFFFF (white at top center)
draw_track:
  ; Outer wall (red)
  LDI r1, 10
  LDI r2, 10
  LDI r3, 236
  LDI r4, 236
  LDI r5, 0xCC0000
  RECTF r1, r2, r3, r4, r5

  ; Track surface (green)
  LDI r1, 25
  LDI r2, 25
  LDI r3, 206
  LDI r4, 206
  LDI r5, 0x005500
  RECTF r1, r2, r3, r4, r5

  ; Inner area (black void)
  LDI r1, 45
  LDI r2, 45
  LDI r3, 166
  LDI r4, 166
  LDI r5, 0x000000
  RECTF r1, r2, r3, r4, r5

  ; Finish line at top-right section of track
  ; White strip from x=25 to x=45 at y=25
  LDI r1, 25
  LDI r2, 24
  LDI r3, 21
  LDI r4, 2
  LDI r5, 0xFFFFFF
  RECTF r1, r2, r3, r4, r5

  RET

; ── Main Game Loop ─────────────────────────────────────────────
game_loop:
; Check game state
LDI r4, 0x3008
LOAD r1, r4
CMPI r1, 2
JZ r0, show_finish           ; game_state == 2 -> finished
JNZ r1, handle_crash          ; game_state == 1 -> crashed

; Increment timer
LDI r4, 0x3006
LOAD r1, r4
ADDI r1, 1
STORE r4, r1
JNZ r1, timer_ok
LDI r4, 0x3007
LOAD r1, r4
ADDI r1, 1
STORE r4, r1
timer_ok:

; Read keyboard input
IKEY r7
CMPI r7, 65                   ; 'A'
JZ r0, steer_left
CMPI r7, 97                   ; 'a'
JZ r0, steer_left
CMPI r7, 68                   ; 'D'
JZ r0, steer_right
CMPI r7, 100                  ; 'd'
JZ r0, steer_right
CMPI r7, 87                   ; 'W'
JZ r0, accelerate
CMPI r7, 119                  ; 'w'
JZ r0, accelerate
CMPI r7, 83                   ; 'S'
JZ r0, brake
CMPI r7, 115                  ; 's'
JZ r0, brake
CMPI r7, 82                   ; 'R'
JZ r0, restart
CMPI r7, 114                  ; 'r'
JZ r0, restart
JMP after_input

steer_left:
LDI r4, 0x3002
LOAD r1, r4
SUBI r1, 16                   ; rotate left ~22.5 degrees
ANDI r1, 0xFF
STORE r4, r1
JMP after_input

steer_right:
LDI r4, 0x3002
LOAD r1, r4
ADDI r1, 16                   ; rotate right ~22.5 degrees
ANDI r1, 0xFF
STORE r4, r1
JMP after_input

accelerate:
LDI r4, 0x3003
LOAD r1, r4
CMPI r1, 5
BGE r0, after_input           ; cap speed at 5
ADDI r1, 1
STORE r4, r1
JMP after_input

brake:
LDI r4, 0x3003
LOAD r1, r4
JZ r1, after_input
SUBI r1, 1
STORE r4, r1
JMP after_input

after_input:
; Apply friction (speed decays by 1 every few frames)
LDI r4, 0x3003
LOAD r1, r4
JZ r1, skip_friction
LDI r4, 0x3006
LOAD r2, r4
ANDI r2, 3
JNZ r2, skip_friction
LDI r4, 0x3003
LOAD r1, r4
JZ r1, skip_friction
SUBI r1, 1
STORE r4, r1
skip_friction:

; Draw track FIRST so PEEK collision has valid screen content
PUSH r31
CALL draw_track
POP r31

; Move car based on angle and speed
PUSH r31
CALL move_car
POP r31

; Check if car crashed (PEEK-based collision)
PUSH r31
CALL check_collision
POP r31

; Check lap crossing
PUSH r31
CALL check_lap
POP r31

; Draw car and HUD on top of track
PUSH r31
CALL draw_car
POP r31
PUSH r31
CALL draw_hud
POP r31

FRAME
JMP game_loop

; ── Handle Crash State ─────────────────────────────────────────
handle_crash:
  LDI r4, 0x3009
  LOAD r1, r4
  ADDI r1, 1
  CMPI r1, 30
  BGE r0, crash_done
  STORE r4, r1
  ; Draw track and car (blinking)
  PUSH r31
  CALL draw_track
  POP r31
  MOV r1, r1
  ANDI r1, 3
  JNZ r1, skip_car_draw
  PUSH r31
  CALL draw_car
  POP r31
skip_car_draw:
  PUSH r31
  CALL draw_hud
  POP r31
  FRAME
  JMP game_loop

crash_done:
  ; Reset car to start position
  LDI r4, 0x3000
  LDI r1, 128
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 35
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 64
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0                    ; reset lap_state
  STORE r4, r1
  LDI r4, 0x3008
  LDI r1, 0                    ; game_state = playing
  STORE r4, r1
  ADDI r4, 1                   ; crash_timer
  LDI r1, 0
  STORE r4, r1
  JMP game_loop

; ── Show Finish Screen ─────────────────────────────────────────
show_finish:
  ; Just keep drawing the scene, car stays still
  PUSH r31
  CALL draw_track
  POP r31
  PUSH r31
  CALL draw_car
  POP r31
  PUSH r31
  CALL draw_hud
  POP r31
  ; Check for R to restart
  IKEY r7
  CMPI r7, 82
  JZ r0, restart
  CMPI r7, 114
  JZ r0, restart
  FRAME
  JMP show_finish

; ── Move Car ───────────────────────────────────────────────────
; Uses car_angle and car_speed to update car_x, car_y
move_car:
  LDI r4, 0x3003
  LOAD r5, r4                  ; r5 = car_speed
  JZ r5, mc_done               ; skip if speed is 0

  ; Get angle
  LDI r4, 0x3002
  LOAD r16, r4                 ; r16 = angle

  ; cos = sin(angle + 64)
  MOV r17, r16
  ADDI r17, 64
  ANDI r17, 0xFF
  LDI r18, 0x4000
  ADD r18, r17
  LOAD r18, r18                ; r18 = cos (signed -126..+126)

  ; sin = sin(angle)
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17                ; r17 = sin (positive = down)

  ; Scale by speed/8: (sine * speed) >> 7 for -126*5/128 ≈ -4.9 to +4.9
  ; Actually use: (sine * speed) >> 5 for ~ -19 to +19, clamp to range
  ; Simpler: just use fixed step based on speed
  ; Speed 1 = step 1, speed 5 = step 5
  ; But we need direction. Direction = (sine * 5) >> 7 gives range -4 to +4
  
  ; Multiply cos by speed, shift result
  MUL r18, r5
  LDI r1, 6                    ; divide by 64 (5*126/64 ≈ 9.8)
  SAR r18, r1
  
  ; Multiply sin by speed, shift result
  MUL r17, r5
  SAR r17, r1

  ; Add to car position
  LDI r4, 0x3000
  LOAD r1, r4
  ADD r1, r18                  ; car_x += cos * speed / 64
  STORE r4, r1
  ADDI r4, 1
  LOAD r1, r4
  ADD r1, r17                  ; car_y += sin * speed / 64
  STORE r4, r1

mc_done:
  RET

; ── Collision Detection (PEEK-based) ──────────────────────────
; PEEK at car position. If color is NOT track green (0x005500),
; car has crashed.
; Track surface is green (0x005500).
; Walls are red (0xCC0000), inner is black (0x000000).
check_collision:
  LDI r4, 0x3000
  LOAD r1, r4                  ; x
  ADDI r4, 1
  LOAD r2, r4                  ; y

  ; PEEK at car position
  SCREENP r3, r1, r2              ; r3 = screen pixel color

  ; Check if on track (green = 0x005500)
  ; Also check if on finish line (white = 0xFFFFFF) - that's fine too
  ; Check for green track surface
  LDI r5, 0x005500
  CMP r3, r5
  JZ r0, cc_on_track

  ; Check for finish line (white)
  LDI r5, 0xFFFFFF
  CMP r3, r5
  JZ r0, cc_on_track

  ; Not on track! Crash!
  LDI r4, 0x3008
  LDI r1, 1                    ; game_state = 1 (crashed)
  STORE r4, r1

  ; Crash sound
  ; BEEP r14, r15 -- skipped to keep it simple
  LDI r4, 0x3009
  LDI r1, 0                    ; crash_timer = 0
  STORE r4, r1

  ; Reset speed
  LDI r4, 0x3003
  LDI r1, 0
  STORE r4, r1

cc_on_track:
  RET

; ── Lap Detection ──────────────────────────────────────────────
; Finish line is at y=24..26 (white strip at top of track)
; When car crosses from bottom (y>26) to top (y<24), count a lap
; Debounce: use lap_state to track crossing direction
check_lap:
  LDI r4, 0x3000
  LOAD r1, r4                  ; car_x
  ADDI r4, 1
  LOAD r2, r4                  ; car_y
  ADDI r4, 1
  LOAD r3, r4                  ; lap_state (0=need forward, 1=forward crossed)

  ; Check if car is near finish line (x=25..45, y around 25)
  CMPI r1, 24
  BLT r0, cl_done              ; x < 24, not near finish
  CMPI r1, 46
  BGE r0, cl_done              ; x >= 46, not near finish

  JZ r3, cl_check_approach     ; lap_state==0: check if approaching from bottom

  ; lap_state==1: car has crossed forward already
  ; Check if car moves below finish line (y > 28) -> reset state
  CMPI r2, 28
  BGE r0, cl_reset             ; y >= 28: car went below, reset
  JMP cl_done

cl_check_approach:
  ; Car is in finish zone, lap_state=0
  ; Check if car approaches from bottom (y > 28 and now y <= 26)
  CMPI r2, 26
  BGE r0, cl_done              ; y >= 26: still below finish, not crossing yet

  ; Car is at y < 26 while in finish zone and previously below
  ; This is a forward crossing -> count lap!
  ; But we need to debounce: only count if car was previously below
  ; Use the previous y position... for simplicity, check crash_timer (since 0 means not in crash)
  ; Actually, let's check if car is clearly crossing from above y=27
  ; Just use: if car_y < 26 and lap_state==0, count it as crossing

  ; Count lap
  LDI r4, 0x3004
  LOAD r1, r4
  ADDI r1, 1                   ; lap_count++
  STORE r4, r1

  ; Set lap_state = 1 (forward crossed, prevent double-count)
  LDI r4, 0x3005
  LDI r1, 1
  STORE r4, r1

  ; Check if won
  LDI r4, 0x3004              ; lap_count
  LOAD r1, r4
  LDI r4, 0x300A              ; total_laps
  LOAD r2, r4
  CMP r1, r2
  BLT r0, cl_done             ; lap_count < total_laps, keep playing
  ; Won!
  LDI r4, 0x3008
  LDI r1, 2                    ; game_state = 2 (finished)
  STORE r4, r1
  JMP cl_done

cl_reset:
  ; Car is below finish line again, reset state for next lap
  LDI r4, 0x3005
  LDI r1, 0
  STORE r4, r1

cl_done:
  RET

; ── Draw Car ───────────────────────────────────────────────────
; Draw car as a small triangle pointing in facing direction
draw_car:
  LDI r4, 0x3008
  LOAD r1, r4
  JNZ r1, dc_skip              ; don't draw if crashed or finished (HUD-only state)

  LDI r4, 0x3000
  LOAD r14, r4                 ; car_x
  ADDI r4, 1
  LOAD r15, r4                 ; car_y

  ; Get angle
  LDI r4, 0x3002
  LOAD r16, r4

  ; cos = sin(angle + 64)
  MOV r17, r16
  ADDI r17, 64
  ANDI r17, 0xFF
  LDI r18, 0x4000
  ADD r18, r17
  LOAD r18, r18                ; r18 = cos

  ; sin = sin(angle)
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17                ; r17 = sin

  ; Nose: car_pos + (cos, sin) * 8
  LDI r19, 8
  MOV r21, r19
  MUL r21, r18
  LDI r22, 6
  SAR r21, r22                 ; cos*8/64
  ADD r21, r14                 ; nose x

  MOV r23, r19
  MUL r23, r17
  SAR r23, r22                 ; sin*8/64
  ADD r23, r15                 ; nose y

  ; Left wing: rotate angle - 85 degrees (add 171 since -85 mod 256 = 171)
  MOV r24, r16
  ADDI r24, 171
  ANDI r24, 0xFF
  LDI r25, 0x4000
  ADD r25, r24
  LOAD r25, r25                ; sin for left wing
  MOV r26, r24
  ADDI r26, 64
  ANDI r26, 0xFF
  LDI r27, 0x4000
  ADD r27, r26
  LOAD r27, r27                ; cos for left wing

  LDI r19, 6
  MOV r28, r19
  MUL r28, r27
  SAR r28, r22
  ADD r28, r14                 ; left wing x
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r15                 ; left wing y

  ; Right wing: rotate angle + 85 degrees
  MOV r24, r16
  ADDI r24, 85
  ANDI r24, 0xFF
  LDI r25, 0x4000
  ADD r25, r24
  LOAD r25, r25                ; sin for right wing
  MOV r26, r24
  ADDI r26, 64
  ANDI r26, 0xFF
  LDI r27, 0x4000
  ADD r27, r26
  LOAD r27, r27                ; cos for right wing

  MOV r1, r19
  MUL r1, r27
  SAR r1, r22
  ADD r1, r14                  ; right wing x
  MOV r2, r19
  MUL r2, r25
  SAR r2, r22
  ADD r2, r15                  ; right wing y

  ; Draw car triangle in yellow
  LDI r3, 0xFFFF00
  LINE r21, r23, r28, r29, r3
  LINE r28, r29, r1, r2, r3
  LINE r1, r2, r21, r23, r3

dc_skip:
  RET

; ── Draw HUD ───────────────────────────────────────────────────
; Display lap count and timer using TEXT opcode
draw_hud:
  ; Build text buffer at 0x3100
  LDI r20, 0x3100

  ; "LAP " prefix
  LDI r1, 76                   ; 'L'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 65                   ; 'A'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 80                   ; 'P'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 32                   ; ' '
  STORE r20, r1
  ADDI r20, 1

  ; Current lap digit (e.g., '1')
  LDI r4, 0x3004
  LOAD r1, r4                  ; lap_count
  ADDI r1, 48                  ; convert to ASCII
  ; Clamp digit to '0'-'9'
  CMPI r1, 57
  BLT r0, lap_digit_ok
  LDI r1, 57
lap_digit_ok:
  STORE r20, r1
  ADDI r20, 1

  ; "/" separator
  LDI r1, 47
  STORE r20, r1
  ADDI r20, 1

  ; Total laps digit
  LDI r4, 0x300A
  LOAD r1, r4
  ADDI r1, 48
  CMPI r1, 57
  BLT r0, tot_digit_ok
  LDI r1, 57
tot_digit_ok:
  STORE r20, r1
  ADDI r20, 1

  ; Space and "T:" for time
  LDI r1, 32
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 84                   ; 'T'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 58                   ; ':'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 32
  STORE r20, r1
  ADDI r20, 1

  ; Timer - display timer_hi as decimal
  LDI r4, 0x3007
  LOAD r1, r4                  ; timer_hi
  ; Convert to ASCII digit (just show one digit for simplicity)
  CMPI r1, 9
  BLT r0, th_ok
  LDI r1, 9
th_ok:
  ADDI r1, 48
  STORE r20, r1
  ADDI r20, 1

  ; Timer - display timer_lo (hundreds digit)
  LDI r4, 0x3006
  LOAD r1, r4
  
  ; Divide by 100 using repeated subtraction to get hundreds digit
  LDI r2, 0                    ; result
  LDI r3, 100                  ; divisor
div_100:
  CMP r1, r3
  BLT r0, div_100_done
  SUB r1, r3
  ADDI r2, 1
  JMP div_100
div_100_done:
  CMPI r2, 9
  BLT r0, hund_ok
  LDI r2, 9
hund_ok:
  ADDI r2, 48
  STORE r20, r2
  ADDI r20, 1

  ; Null terminate
  LDI r1, 0
  STORE r20, r1

  ; Render HUD text at top-left of screen
  ; TEXT x_reg, y_reg, addr_reg
  LDI r10, 0x3100              ; address of text buffer
  LDI r11, 2                   ; x = 2
  LDI r12, 4                   ; y = 4
  TEXT r11, r12, r10

  ; If game is finished, show "FINISHED!"
  LDI r4, 0x3008
  LOAD r1, r4
  CMPI r1, 2
  JNZ r0, hud_done

  ; Overwrite with "FINISHED!" text
  LDI r20, 0x3100
  LDI r1, 70                   ; 'F'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 73                   ; 'I'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 78                   ; 'N'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 73                   ; 'I'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 83                   ; 'S'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 72                   ; 'H'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 69                   ; 'E'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 68                   ; 'D'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 33                   ; '!'
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 0                    ; null terminator
  STORE r20, r1

  LDI r10, 0x3100
  LDI r11, 85                  ; x = 85 (center-ish)
  LDI r12, 128                 ; y = 128 (center-ish)
  TEXT r11, r12, r10

hud_done:
  RET

; ── End ────────────────────────────────────────────────────────
; Infinite loop game, no HALT
