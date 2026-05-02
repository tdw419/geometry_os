; ═══════════════════════════════════════════════════════════════
; L-System Fractal Generator for Geometry OS
; Koch Snowflake with turtle graphics
; 12-entry sin table (30 degree resolution) for exact 60 degree angles
; ═══════════════════════════════════════════════════════════════
;
; Memory Layout:
; 0x2000-0x2FFF  Axiom and expansion buffer (4096 chars)
; 0x3000-0x3FFF  Temp expansion buffer (4096 chars)
; 0x4000-0x40FF  Production rule buffer (256 chars)
; 0x5100        Turn angle (60)
; 0x5104        Iterations (3)
; 0x7000-0x700B  Sin lookup table (12 entries, signed fixed-point)
;
; Characters: F=70(draw)  +=43(turn left)  -=45(turn right)
; Angle convention: 0=up 90=right 180=down 270=left
; dx = sin(angle) * step / 256
; dy = -cos(angle) * step / 256

; ── Main Program ─────────────────────────────────────────────
main:
  LDI r30, 0xFF00          ; CRITICAL: init stack pointer
  LDI r6, 1               ; r6 = increment constant
  CALL init_sin_table
  CALL setup_koch
  CALL expand_lsystem
  CALL render_fractal
  HALT

; ── Setup Koch Snowflake preset ──────────────────────────────
; Axiom: F--F--F   Rule: F -> F+F--F+F
; Turn angle: 60 degrees   Iterations: 3
setup_koch:
  ; Write axiom "F--F--F" at 0x2000 (7 chars + null = 8 words)
  LDI r5, 0x2000
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 45              ; -
  STORE r5, r1
  ADD r5, r6
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 45              ; -
  STORE r5, r1
  ADD r5, r6
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 0               ; null terminator
  STORE r5, r1

  ; Write rule: char F at 0x4000, production "F+F--F+F" at 0x4001
  LDI r5, 0x4000
  LDI r1, 70              ; rule predecessor: F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 43              ; +
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 45              ; -
  STORE r5, r1
  ADD r5, r6
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 43              ; +
  STORE r5, r1
  ADD r5, r6
  LDI r1, 70              ; F
  STORE r5, r1
  ADD r5, r6
  LDI r1, 0               ; null terminator
  STORE r5, r1

  ; Drawing params: turn_angle at 0x5100, iterations at 0x5104
  LDI r5, 0x5100
  LDI r1, 60
  STORE r5, r1            ; turn_angle = 60 degrees
  LDI r5, 0x5104
  LDI r1, 3
  STORE r5, r1            ; iterations = 3

  RET

; ── Build 12-entry sin lookup table at 0x7000 ───────────────
; 30 degree resolution: 0, 30, 60, 90, ..., 330
; Signed fixed-point: -256..256 maps to -1.0..1.0 (two's complement)
; sin(0)=0 sin(30)=128 sin(60)=222 sin(90)=256
; sin(120)=222 sin(150)=128 sin(180)=0 sin(210)=-128
; sin(240)=-222 sin(270)=-256 sin(300)=-222 sin(330)=-128
init_sin_table:
  PUSH r31
  LDI r5, 0x7000
  LDI r1, 0               ; sin(0)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 128             ; sin(30)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 222             ; sin(60)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 256             ; sin(90)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 222             ; sin(120)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 128             ; sin(150)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 0               ; sin(180)
  STORE r5, r1
  ADD r5, r6
  LDI r1, 128
  NEG r1                  ; sin(210) = -128
  STORE r5, r1
  ADD r5, r6
  LDI r1, 222
  NEG r1                  ; sin(240) = -222
  STORE r5, r1
  ADD r5, r6
  LDI r1, 256
  NEG r1                  ; sin(270) = -256
  STORE r5, r1
  ADD r5, r6
  LDI r1, 222
  NEG r1                  ; sin(300) = -222
  STORE r5, r1
  ADD r5, r6
  LDI r1, 128
  NEG r1                  ; sin(330) = -128
  STORE r5, r1
  POP r31
  RET

; ── Wrap angle (r1) to 0-359 ────────────────────────────────
wrap_angle:
  PUSH r31
wa_loop:
  LDI r4, 360
  CMP r1, r4
  BLT r0, wa_neg
  SUB r1, r4
  JMP wa_loop
wa_neg:
  LDI r4, 0
  CMP r1, r4
  BGE r0, wa_done
  LDI r4, 360
  ADD r1, r4
  JMP wa_neg
wa_done:
  POP r31
  RET

; ── Expand L-System by N iterations ─────────────────────────
; Reads axiom from 0x2000, rule from 0x4000, iteration count from 0x5104
; Alternates between 0x2000 and 0x3000 as source/dest
; Final result always placed at 0x3000
expand_lsystem:
  PUSH r31
  PUSH r1
  PUSH r2
  LDI r5, 0x5104
  LOAD r7, r5              ; r7 = remaining iterations

exp_loop:
  JZ r7, expand_done

  ; Load rule char from 0x4000
  LDI r5, 0x4000
  LOAD r4, r5              ; r4 = rule char (F=70)

  ; Alternate source/dest based on iteration number (0-indexed)
  ; First iteration (r7=total): source=0x2000 (axiom), dest=0x3000
  ; We compute which pass: pass_num = total - remaining
  MOV r1, r7
  LDI r5, 1
  AND r1, r5
  JZ r1, exp_odd_pass
  ; r7 is odd: even pass number → source=0x2000, dest=0x3000
  LDI r2, 0x2000
  LDI r3, 0x3000
  JMP exp_do
exp_odd_pass:
  ; r7 is even: odd pass number → source=0x3000, dest=0x2000
  LDI r2, 0x3000
  LDI r3, 0x2000
exp_do:
  CALL do_expansion
  SUB r7, r6
  JMP exp_loop

expand_done:
  ; After all iterations, if total was odd, result ended at 0x3000
  ; If total was even, result ended at 0x2000 - copy to 0x3000
  LDI r5, 0x5104
  LOAD r7, r5
  MOV r1, r7
  LDI r5, 1
  AND r1, r5
  JNZ r1, expand_skip_copy
  ; Even total: result is at 0x2000, copy to 0x3000
  LDI r2, 0x2000
  LDI r3, 0x3000
  CALL copy_string
expand_skip_copy:
  POP r2
  POP r1
  POP r31
  RET

; ── Single expansion pass ───────────────────────────────────
; r2 = source address, r3 = dest address, r4 = rule char
do_expansion:
  PUSH r31
do_exp_loop:
  LOAD r1, r2              ; r1 = current char from source
  JZ r1, do_exp_done       ; null = end of string
  CMP r1, r4               ; compare with rule char
  JNZ r0, do_exp_copy      ; if not matching, just copy (use r0!)
  ; Match found: copy production from 0x4001
  CALL copy_production
  JMP do_exp_next
do_exp_copy:
  STORE r3, r1             ; copy non-matching char to dest
  ADD r3, r6
do_exp_next:
  ADD r2, r6               ; advance source pointer
  JMP do_exp_loop
do_exp_done:
  LDI r1, 0
  STORE r3, r1             ; null terminate dest
  POP r31
  RET

; ── Copy production string from 0x4001 to address in r3 ────
copy_production:
  PUSH r31
  LDI r5, 0x4001
cp_loop:
  LOAD r1, r5
  JZ r1, cp_done
  STORE r3, r1
  ADD r3, r6
  ADD r5, r6
  JMP cp_loop
cp_done:
  POP r31
  RET

; ── Copy null-terminated string: r2=src, r3=dest ────────────
copy_string:
  PUSH r31
cs_loop:
  LOAD r1, r2
  STORE r3, r1
  JZ r1, cs_done
  ADD r2, r6
  ADD r3, r6
  JMP cs_loop
cs_done:
  POP r31
  RET

; ── Render fractal with turtle graphics ──────────────────────
; Reads expanded string from 0x3000, draws with LINE opcode
render_fractal:
  PUSH r31
  PUSH r1
  PUSH r2

  ; Clear screen to dark blue-black
  LDI r1, 0x000011
  FILL r1

  ; Load drawing params
  LDI r5, 0x5100
  LOAD r14, r5             ; r14 = turn_angle (60)
  LDI r5, 0x5104
  LOAD r7, r5              ; r7 = iterations (3)

  ; Compute effective step = 100 / 3^iterations
  ; Koch snowflake with 3 iterations: 100/27 = 3 pixels per segment
  ; Snowflake side = 64 segments * 3px = 192px, fits in 256x256
  LDI r13, 100             ; base step size
  LDI r1, 0               ; division counter
step_div_loop:
  CMP r1, r7               ; compare counter with iterations
  BGE r0, step_div_done    ; counter >= iterations means done
  ; Divide r13 by 3 using repeated subtraction
  LDI r4, 0
  ADD r4, r13              ; r4 = copy of r13
  LDI r5, 3
  LDI r8, 0               ; quotient
div_inner:
  CMP r4, r5
  BLT r0, div_inner_done
  SUB r4, r5
  ADD r8, r6
  JMP div_inner
div_inner_done:
  MOV r13, r8              ; r13 = r13 / 3
  ADD r1, r6               ; counter++
  JMP step_div_loop
step_div_done:
  ; r13 is now the effective step (150/27 = 5)

  ; Turtle starting state (centered)
  LDI r10, 128             ; x start (center)
  LDI r11, 200             ; y start (near bottom)
  LDI r12, 0               ; angle = 0 (pointing up)

  ; Line color: bright cyan
  LDI r15, 0x00FFFF

  ; Iterate over expanded string at 0x3000
  LDI r5, 0x3000

render_loop:
  LOAD r1, r5              ; r1 = current character
  JZ r1, render_done       ; null = end of string

  ; Check for F (70) = draw forward
  LDI r2, 70
  CMP r1, r2
  JNZ r0, chk_plus          ; use r0 for CMP result!
  ; Draw line from current to next position
  MOV r8, r10              ; r8 = old x
  MOV r9, r11              ; r9 = old y
  CALL compute_step        ; updates r10, r11
  LINE r8, r9, r10, r11, r15
  JMP rend_next

chk_plus:
  ; Check for + (43) = turn left
  LDI r2, 43
  CMP r1, r2
  JNZ r0, chk_minus         ; use r0 for CMP result!
  ADD r12, r14             ; angle += turn_angle
  CALL wrap_angle_reg
  JMP rend_next

chk_minus:
  ; Check for - (45) = turn right
  LDI r2, 45
  CMP r1, r2
  JNZ r0, rend_next         ; use r0 for CMP result!
  SUB r12, r14             ; angle -= turn_angle
  CALL wrap_angle_reg

rend_next:
  ADD r5, r6               ; advance string pointer
  JMP render_loop

render_done:
  POP r2
  POP r1
  POP r31
  RET

; ── Wrap angle register r12 to 0-359 ────────────────────────
wrap_angle_reg:
  PUSH r31
war_loop:
  LDI r4, 360
  CMP r12, r4
  BLT r0, war_neg
  SUB r12, r4
  JMP war_loop
war_neg:
  LDI r4, 0
  CMP r12, r4
  BGE r0, war_done
  LDI r4, 360
  ADD r12, r4
  JMP war_neg
war_done:
  POP r31
  RET

; ── Compute turtle step from current angle ───────────────────
; Input:  r12 = angle (degrees), r13 = step length
; Output: r10 += dx, r11 += dy (updates turtle position)
; Uses:   r1-r4 (scratch), r12, r13 (preserved)
; NOTE: Signed multiply-divide using sign extraction
compute_step:
  PUSH r31

  ; Look up sin(angle) from 12-entry table
  ; sin_idx = angle * 12 / 360
  MOV r1, r12
  LDI r4, 12
  MUL r1, r4              ; r1 = angle * 12
  LDI r4, 360
  DIV r1, r4              ; r1 = angle * 12 / 360
  LDI r4, 11
  CMP r1, r4
  BLT r0, si_ok
  MOV r1, r4              ; clamp to max index 11
si_ok:
  LDI r4, 0x7000
  ADD r4, r1              ; r4 = table address
  LOAD r2, r4              ; r2 = sin(angle) signed fixed-point

  ; Look up cos(angle) = sin(angle + 90)
  MOV r1, r12
  LDI r4, 90
  ADD r1, r4              ; r1 = angle + 90
  CALL wrap_angle          ; wrap to 0-359
  LDI r4, 12
  MUL r1, r4
  LDI r4, 360
  DIV r1, r4
  LDI r4, 11
  CMP r1, r4
  BLT r0, ci_ok
  MOV r1, r4
ci_ok:
  LDI r4, 0x7000
  ADD r4, r1
  LOAD r3, r4              ; r3 = cos(angle) signed fixed-point

  ; Signed multiply-divide: dx = signed(sin) * step / 256
  ; Extract sign of sin, work with absolute value
  PUSH r0                 ; save CMP result (not strictly needed)
  MOV r1, r2              ; r1 = sin value
  LDI r4, 31
  SAR r1, r4              ; r1 = 0xFFFFFFFF if negative, 0 if positive
  MOV r4, r1              ; r4 = sin sign
  JZ r4, sin_pos
  NEG r2                  ; negate sin to get absolute value
sin_pos:
  MUL r2, r13              ; r2 = |sin| * step (unsigned)
  LDI r1, 256
  DIV r2, r1              ; r2 = |sin| * step / 256
  JZ r4, dx_done
  NEG r2                  ; reapply sign
dx_done:

  ; Signed multiply-divide: dy = -signed(cos) * step / 256
  MOV r1, r3              ; r1 = cos value
  LDI r4, 31
  SAR r1, r4              ; sign of cos
  MOV r4, r1              ; r4 = cos sign
  JZ r4, cos_pos
  NEG r3                  ; absolute value of cos
cos_pos:
  MUL r3, r13              ; r3 = |cos| * step
  LDI r1, 256
  DIV r3, r1              ; r3 = |cos| * step / 256
  JZ r4, dy_sign
  NEG r3                  ; reapply cos sign
dy_sign:
  NEG r3                   ; negate for screen y inversion

  ; Update turtle position
  ADD r10, r2              ; x += dx
  ADD r11, r3              ; y += dy

  POP r0
  POP r31
  RET
