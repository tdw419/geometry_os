; lsystem_tree.asm -- L-System Fractal Tree
;
; L-System: F -> FF+[+F-F-F]-[-F+F+F], Axiom: F, 3 iterations
; Turtle: F=forward, +=right 25deg, -=left 25deg, [=push, ]=pop
; Color gradient by recursion depth:
;   depth 0: brown trunk  0x8B4513
;   depth 1: dark olive   0x556B2F
;   depth 2: olive green  0x6B8E23
;   depth 3+: bright green 0x228B22
;
; Memory:
;   0x3000-0x3FFF = string buffer (current gen, max ~4K)
;   0x4000-0x4FFF = string buffer (next gen)
;   0x5000-0x5FFF = turtle stack (3 words/entry: x, y, angle)
;   0x7000-0x70FF = trig table (256 entries, center=128)
;   0x7100-0x710F = color gradient table (4 entries)
;
; Registers:
;   r1-r5=temps  r6=seg_len  r7=turn_angle  r8=x  r9=y
;   r10=angle  r11=stack_ptr  r12=char  r13=color
;   r14=str_ptr  r15=dest_ptr  r16=iter  r17=depth
;   r20=256  r21=1  r22=x0  r19=y0 (line start)

LDI r30, 0xFF00
LDI r20, 256
LDI r21, 1

; === Build triangle-wave table at 0x7000 (center=128, amplitude=126) ===
; Quadrants: 0-63 ascending, 64-127 descending, 128-191 descending, 192-255 ascending
; table[i] - 128 gives signed amplitude in [-126, +126]
LDI r1, 0x7000
LDI r2, 256
LDI r3, 0
build_tbl:
  CMP r3, r2
  BGE r0, tbl_done

  LDI r4, 64
  CMP r3, r4
  BLT r0, tbl_q0

  LDI r4, 128
  CMP r3, r4
  BLT r0, tbl_q1

  LDI r4, 192
  CMP r3, r4
  BLT r0, tbl_q2

  ; else (192-255): val = i*2 - 382
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 382
  SUB r4, r5
  JMP tbl_store

tbl_q0:
  ; (0-63): val = i*2 + 128
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 128
  ADD r4, r5
  JMP tbl_store

tbl_q1:
  ; (64-127): val = 382 - i*2
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 382
  SUB r4, r5
  NEG r4
  JMP tbl_store

tbl_q2:
  ; (128-191): val = 384 - i*2
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 384
  SUB r4, r5
  NEG r4

tbl_store:
  STORE r1, r4
  ADD r1, r21
  ADD r3, r21
  CMP r3, r2
  BLT r0, build_tbl

tbl_done:

; === Color gradient table at 0x7100 (4 entries, indexed by depth) ===
LDI r1, 0x7100
LDI r12, 0x8B4513       ; depth 0: brown trunk
STORE r1, r12
ADD r1, r21
LDI r12, 0x556B2F       ; depth 1: dark olive
STORE r1, r12
ADD r1, r21
LDI r12, 0x6B8E23       ; depth 2: olive green
STORE r1, r12
ADD r1, r21
LDI r12, 0x228B22       ; depth 3+: bright green leaves
STORE r1, r12

; === Axiom: "F" at 0x3000 ===
LDI r14, 0x3000
LDI r12, 70
STORE r14, r12
ADD r14, r21
LDI r12, 0
STORE r14, r12

; === 3 iterations of string rewriting ===
; F -> FF+[+F-F-F]-[-F+F+F]  (21 chars per F, 8 F's per expansion)
; Iter 1: 21 chars, Iter 2: 181 chars, Iter 3: 1461 chars
LDI r16, 3
iter_loop:
  LDI r14, 0x3000
  LDI r15, 0x4000
rw_loop:
  LOAD r12, r14
  JZ r12, rw_done
  LDI r1, 70
  CMP r12, r1
  JNZ r0, pass_thru

  ; F -> FF+[+F-F-F]-[-F+F+F]
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 43
  STORE r15, r12
  ADD r15, r21
  LDI r12, 91
  STORE r15, r12
  ADD r15, r21
  LDI r12, 43
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 45
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 45
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 93
  STORE r15, r12
  ADD r15, r21
  LDI r12, 45
  STORE r15, r12
  ADD r15, r21
  LDI r12, 91
  STORE r15, r12
  ADD r15, r21
  LDI r12, 45
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 43
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 43
  STORE r15, r12
  ADD r15, r21
  LDI r12, 70
  STORE r15, r12
  ADD r15, r21
  LDI r12, 93
  STORE r15, r12
  ADD r15, r21
  JMP rw_next
pass_thru:
  STORE r15, r12
  ADD r15, r21
rw_next:
  ADD r14, r21
  JMP rw_loop
rw_done:
  LDI r12, 0
  STORE r15, r12
  SUB r16, r21
  JZ r16, expand_done
  ; Copy 0x4000 -> 0x3000
  LDI r14, 0x4000
  LDI r15, 0x3000
swap_lp:
  LOAD r12, r14
  STORE r15, r12
  JZ r12, swap_done
  ADD r14, r21
  ADD r15, r21
  JMP swap_lp
swap_done:
  JMP iter_loop
expand_done:

; === Copy final result from 0x4000 to 0x3000 ===
LDI r14, 0x4000
LDI r15, 0x3000
final_swap:
  LOAD r12, r14
  STORE r15, r12
  JZ r12, final_swap_done
  ADD r14, r21
  ADD r15, r21
  JMP final_swap
final_swap_done:

; === Turtle graphics interpreter ===
LDI r8, 128             ; start x (center)
LDI r9, 220             ; start y (near bottom)
LDI r10, 0              ; angle 0 = up
LDI r6, 5               ; segment length
LDI r7, 4551            ; 25 degrees (65536/14.4)
LDI r17, 0              ; depth (bracket nesting)
LDI r11, 0x5FFD         ; stack ptr (grows down from 0x6000)

LDI r1, 0
FILL r1                 ; clear screen

LDI r14, 0x3000         ; point to expanded string

turtle_loop:
  LOAD r12, r14
  JZ r12, tree_done

  ; Check for 'F' (70)
  LDI r1, 70
  CMP r12, r1
  JNZ r0, chk_plus
  PUSH r31
  CALL draw_fwd
  POP r31
  JMP t_next

chk_plus:
  ; Check for '+' (43)
  LDI r1, 43
  CMP r12, r1
  JNZ r0, chk_minus
  ADD r10, r7
  ; Mask angle to 16 bits so >>8 stays in [0,255] for table lookup
  LDI r1, 0xFFFF
  AND r10, r1
  JMP t_next

chk_minus:
  ; Check for '-' (45)
  LDI r1, 45
  CMP r12, r1
  JNZ r0, chk_lb
  SUB r10, r7
  ; Mask angle to 16 bits (unsigned SUB wraps; must constrain)
  LDI r1, 0xFFFF
  AND r10, r1
  JMP t_next

chk_lb:
  ; Check for '[' (91) -- push state
  LDI r1, 91
  CMP r12, r1
  JNZ r0, chk_rb
  STORE r11, r8
  SUB r11, r21
  STORE r11, r9
  SUB r11, r21
  STORE r11, r10
  SUB r11, r21
  ADD r17, r21
  JMP t_next

chk_rb:
  ; Check for ']' (93) -- pop state
  LDI r1, 93
  CMP r12, r1
  JNZ r0, t_next
  ADD r11, r21
  LOAD r10, r11
  ADD r11, r21
  LOAD r9, r11
  ADD r11, r21
  LOAD r8, r11
  ; Clamp depth before decrement (defensive)
  LDI r1, 0
  CMP r17, r1
  BGE r0, dep_ok
  LDI r17, 0
dep_ok:
  SUB r17, r21

t_next:
  ADD r14, r21
  JMP turtle_loop

tree_done:
  HALT

; === draw_fwd subroutine ===
; Reads angle (r10), seg_len (r6) to compute dx, dy via trig table.
; Draws LINE from current (r8,r9) to (r8+dx, r9+dy) with depth color.
;
; Trig: sin_idx = angle >> 8, cos_idx = (sin_idx + 64) & 0xFF
; table[i] - 128 = signed amplitude in [-126, +126]
; dx = (sin_val * length) >> 7   (SAR for signed arithmetic)
; dy = -(cos_val * length) >> 7  (SAR for signed arithmetic)
draw_fwd:
  PUSH r31
  PUSH r8
  PUSH r9

  ; sin_idx = angle >> 8
  MOV r1, r10
  LDI r2, 8
  SHR r1, r2

  ; cos_idx = (sin_idx + 64) & 0xFF
  MOV r2, r1
  LDI r3, 64
  ADD r2, r3
  LDI r3, 255
  AND r2, r3

  ; sin_val = table[sin_idx] - 128
  MOV r3, r1
  LDI r4, 0x7000
  ADD r3, r4
  LOAD r3, r3
  LDI r5, 128
  SUB r3, r5

  ; cos_val = table[cos_idx] - 128
  MOV r4, r2
  LDI r5, 0x7000
  ADD r4, r5
  LOAD r4, r4
  LDI r5, 128
  SUB r4, r5

  ; dx = (sin_val * length) >> 7  -- SAR preserves sign
  MOV r5, r3
  MUL r5, r6
  LDI r1, 7
  SAR r5, r1

  ; dy = -(cos_val * length) >> 7  -- SAR preserves sign
  MOV r1, r4
  MUL r1, r6
  LDI r2, 7
  SAR r1, r2
  NEG r1

  ; Restore position, compute new position
  POP r9
  POP r8
  MOV r22, r8
  MOV r19, r9
  ADD r8, r5
  ADD r9, r1

  ; Color from gradient table at 0x7100, indexed by depth (clamped to 3)
  LDI r1, 0x7100
  MOV r2, r17
  LDI r3, 3
  CMP r2, r3
  BLT r0, depth_ok
  LDI r2, 3
depth_ok:
  ADD r1, r2
  LOAD r13, r1

do_line:
  LINE r22, r19, r8, r9, r13

  POP r31
  RET
