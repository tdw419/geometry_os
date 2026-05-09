; lsystem_tree.asm -- L-System Fractal Tree
;
; L-System: F -> FF+[+F-F-F]-[-F+F+F], Axiom: F, 3 iterations
; Turtle: F=forward, +=right 25deg, -=left 25deg, [=push, ]=pop
; Trunk: brown 0x8B4513, Leaves: green 0x228B22
;
; Memory:
;   0x3000-0x3FFF = string buffer (current gen, max ~4K)
;   0x4000-0x4FFF = string buffer (next gen)
;   0x5000-0x5FFF = turtle stack (3 words/entry: x, y, angle)
;   0x7000-0x70FF = sin/cos table (256 entries, center=128)

; Registers:
;   r1-r5=temps  r6=seg_len  r7=turn_angle  r8=x  r9=y
;   r10=angle  r11=stack_ptr  r12=char  r13=color
;   r14=str_ptr  r15=dest_ptr  r16=iter  r17=depth
;   r20=256  r21=1  r22=x0  r19=y0 (line start)

LDI r20, 256
LDI r21, 1

; === Build sine-like table at 0x7000 (triangle wave, center=128) ===
; Table[i] = center + amplitude * triangle(i)
; Triangle: 0->1 over 0-63, 1->-1 over 64-191, -1->0 over 192-255
; Encoded as: 0-63: 128+i*2, 64-127: 382-i*2, 128-191: 382-i*2,
;              192-255: i*2-382+256 ... simpler:
; Just use: table[i] where sin = table[i] - 128
; 0-63: i*2 (0..126), 64-127: 254-(i-64)*2 = 318-i*2 (254..128)
; 128-191: 128-(i-128)*2 = 384-i*2 (128..2), 192-255: (i-192)*2 (0..126)
LDI r1, 0x7000
LDI r2, 256
LDI r3, 0
build_tbl:
  ; Compute value for index r3
  CMP r3, r2
  BGE r0, tbl_done       ; shouldn't happen but safety

  ; if r3 < 64: val = r3 * 2
  LDI r4, 64
  CMP r3, r4
  BLT r0, tbl_q0

  ; if r3 < 128: val = 318 - r3*2  (actually 254-(r3-64)*2 = 382-r3*2)
  LDI r4, 128
  CMP r3, r4
  BLT r0, tbl_q1

  ; if r3 < 192: val = 384 - r3*2
  LDI r4, 192
  CMP r3, r4
  BLT r0, tbl_q2

  ; else: val = i*2 - 382
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 382
  SUB r4, r5
  JMP tbl_store

tbl_q0:
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 128
  ADD r4, r5
  JMP tbl_store

tbl_q1:
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 382
  SUB r4, r5
  JMP tbl_store

tbl_q2:
  MOV r4, r3
  LDI r5, 2
  MUL r4, r5
  LDI r5, 384
  SUB r4, r5

tbl_store:
  STORE r1, r4
  ADD r1, r21
  ADD r3, r21
  CMP r3, r2
  BLT r0, build_tbl

tbl_done:

; === Axiom: "F" at 0x3000 ===
LDI r14, 0x3000
LDI r12, 70
STORE r14, r12
ADD r14, r21
LDI r12, 0
STORE r14, r12

; === 3 iterations of string rewriting ===
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

  ; F -> FF+[+F-F-F]-[-F+F+F] (21 chars)
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  STORE r15, r12; ADD r15, r21
  LDI r12, 43; STORE r15, r12; ADD r15, r21
  LDI r12, 91; STORE r15, r12; ADD r15, r21
  LDI r12, 43; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 45; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 45; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 93; STORE r15, r12; ADD r15, r21
  LDI r12, 45; STORE r15, r12; ADD r15, r21
  LDI r12, 91; STORE r15, r12; ADD r15, r21
  LDI r12, 45; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 43; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 43; STORE r15, r12; ADD r15, r21
  LDI r12, 70; STORE r15, r12; ADD r15, r21
  LDI r12, 93; STORE r15, r12; ADD r15, r21
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

; === Turtle graphics ===
LDI r8, 128
LDI r9, 220
LDI r10, 0             ; angle 0 = up
LDI r6, 3              ; segment length
LDI r7, 4551           ; 25 degrees
LDI r17, 0             ; depth
LDI r11, 0x5FFD        ; stack ptr

LDI r1, 0
FILL r1

LDI r14, 0x3000

turtle_loop:
  LOAD r12, r14
  JZ r12, tree_done
  LDI r1, 70
  CMP r12, r1
  JNZ r0, chk_plus
  PUSH r31
  CALL draw_fwd
  POP r31
  JMP t_next
chk_plus:
  LDI r1, 43
  CMP r12, r1
  JNZ r0, chk_minus
  ADD r10, r7
  JMP t_next
chk_minus:
  LDI r1, 45
  CMP r12, r1
  JNZ r0, chk_lb
  SUB r10, r7
  JMP t_next
chk_lb:
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
  LDI r1, 93
  CMP r12, r1
  JNZ r0, t_next
  ADD r11, r21
  LOAD r10, r11
  ADD r11, r21
  LOAD r9, r11
  ADD r11, r21
  LOAD r8, r11
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

; === draw_fwd ===
; Uses table at 0x7000 where value-128 gives signed sine (-128..127)
; sin_idx = angle >> 8, cos_idx = (sin_idx + 64) & 0xFF
; dx = (sin_val * length) >> 7, dy = -(cos_val * length) >> 7
draw_fwd:
  PUSH r31
  PUSH r8
  PUSH r9

  MOV r1, r10
  LDI r2, 8
  SHR r1, r2           ; sin_idx

  MOV r2, r1
  LDI r3, 64
  ADD r2, r3
  LDI r3, 255
  AND r2, r3           ; cos_idx

  ; sin_val = table[sin_idx] - 128
  MOV r3, r1
  LDI r4, 0x7000
  ADD r3, r4
  LOAD r3, r3
  LDI r5, 128
  SUB r3, r5           ; sin_val (signed)

  ; cos_val = table[cos_idx] - 128
  MOV r4, r2
  LDI r5, 0x7000
  ADD r4, r5
  LOAD r4, r4
  LDI r5, 128
  SUB r4, r5           ; cos_val (signed)

  ; dx = (sin_val * length) >> 7
  MOV r5, r3
  MUL r5, r6
  LDI r1, 7
  SHR r5, r1

  ; dy = -(cos_val * length) >> 7
  MOV r1, r4
  MUL r1, r6
  LDI r2, 7
  SHR r1, r2
  NEG r1

  POP r9
  POP r8
  MOV r22, r8
  MOV r19, r9
  ADD r8, r5
  ADD r9, r1

  ; Color: depth 0 = brown trunk, depth > 0 = green
  LDI r1, 0
  CMP r17, r1
  JNZ r0, is_leaf
  LDI r13, 0x8B4513
  JMP do_line
is_leaf:
  LDI r13, 0x228B22
do_line:
  LINE r22, r19, r8, r9, r13

  POP r31
  RET
