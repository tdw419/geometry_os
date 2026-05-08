; DESCRIPTION: Geometry OS program to draw a colored object.

; lsystem.asm -- L-System Fractal Generator
; Interactive fractal renderer with 5 presets
; Keys: 1-5 switch preset, +/- adjust iterations
;
; RAM layout:
;   0x2000-0x2FFF  source buffer (expansion input)
;   0x3000-0x3FFF  expanded output buffer
;   0x5000-0x50FF  axiom storage
;   0x5100-0x51FF  rule F replacement
;   0x5200-0x52FF  rule G replacement
;   0x5300-0x53FF  rule X replacement
;   0x5400-0x54FF  rule Y replacement
;   0x5500  current preset (1-5)
;   0x5501  iteration count (1-8)
;   0x5502  line length
;   0x5503  angle increment (fixed-point: degrees * 182)
;   0x5504  draw color
;   0x7000-0x7007  cos_table (8 entries, fixed-point *256)
;   0x7010-0x7017  sin_table (8 entries, fixed-point *256)

; ---- Bootstrap ----
LDI r30, 0xFF00
LDI r21, 0

CALL build_trig_tables
CALL init_koch
CALL do_expand

; ---- Main Loop ----
main_loop:
  FILL r21
  CALL do_render
  CALL draw_info
  FRAME
  IKEY r9
  JZ r9, main_loop

  ; key 1
  LDI r1, 49
  CMP r9, r1
  JZ r0, key_1
  ; key 2
  LDI r1, 50
  CMP r9, r1
  JZ r0, key_2
  ; key 3
  LDI r1, 51
  CMP r9, r1
  JZ r0, key_3
  ; key 4
  LDI r1, 52
  CMP r9, r1
  JZ r0, key_4
  ; key 5
  LDI r1, 53
  CMP r9, r1
  JZ r0, key_5
  ; + or =
  LDI r1, 43
  CMP r9, r1
  JZ r0, key_plus
  LDI r1, 61
  CMP r9, r1
  JZ r0, key_plus
  ; - or _
  LDI r1, 45
  CMP r9, r1
  JZ r0, key_minus
  LDI r1, 95
  CMP r9, r1
  JZ r0, key_minus

  JMP main_loop

key_1:
  PUSH r31
  CALL init_koch
  POP r31
  JMP key_regen
key_2:
  PUSH r31
  CALL init_sierpinski
  POP r31
  JMP key_regen
key_3:
  PUSH r31
  CALL init_dragon
  POP r31
  JMP key_regen
key_4:
  PUSH r31
  CALL init_fern
  POP r31
  JMP key_regen
key_5:
  PUSH r31
  CALL init_tree
  POP r31
  JMP key_regen
key_plus:
  LDI r8, 0x5501
  LOAD r11, r8
  LDI r7, 8
  CMP r11, r7
  BGE r0, main_loop
  LDI r7, 1
  ADD r11, r7
  STORE r8, r11
  JMP key_regen
key_minus:
  LDI r8, 0x5501
  LOAD r11, r8
  LDI r7, 1
  CMP r11, r7
  BLT r0, main_loop
  LDI r7, 1
  SUB r11, r7
  STORE r8, r11
  JMP key_regen
key_regen:
  PUSH r31
  CALL do_expand
  POP r31
  JMP main_loop

; ==== Trig Tables ====
; 8-sector cos/sin tables, fixed-point * 256
; Sector: 0=E 1=NE 2=N 3=NW 4=W 5=SW 6=S 7=SE
; cos:    256, 181, 0, -181(0xFFFF73), -256(0xFFFFFF00), -181, 0, 181
; sin:    0, 181, 256, 181, 0, -181(0xFFFF73), -256(0xFFFFFF00), -181

build_trig_tables:
  ; cos_table at 0x7000
  LDI r8, 0x7000
  LDI r14, 256
  STORE r8, r14
  LDI r8, 0x7001
  LDI r14, 181
  STORE r8, r14
  LDI r8, 0x7002
  LDI r14, 0
  STORE r8, r14
  LDI r8, 0x7003
  LDI r14, 0xFFFF73
  STORE r8, r14
  LDI r8, 0x7004
  LDI r14, 0xFFFFFF00
  STORE r8, r14
  LDI r8, 0x7005
  LDI r14, 0xFFFF73
  STORE r8, r14
  LDI r8, 0x7006
  LDI r14, 0
  STORE r8, r14
  LDI r8, 0x7007
  LDI r14, 181
  STORE r8, r14
  ; sin_table at 0x7010
  LDI r8, 0x7010
  LDI r14, 0
  STORE r8, r14
  LDI r8, 0x7011
  LDI r14, 181
  STORE r8, r14
  LDI r8, 0x7012
  LDI r14, 256
  STORE r8, r14
  LDI r8, 0x7013
  LDI r14, 181
  STORE r8, r14
  LDI r8, 0x7014
  LDI r14, 0
  STORE r8, r14
  LDI r8, 0x7015
  LDI r14, 0xFFFF73
  STORE r8, r14
  LDI r8, 0x7016
  LDI r14, 0xFFFFFF00
  STORE r8, r14
  LDI r8, 0x7017
  LDI r14, 0xFFFF73
  STORE r8, r14
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r14, 1
  LDI r8, 0x5500
  STORE r8, r14
  ; axiom: F--F--F (at 0x5000)
  LDI r8, 0x5000
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5001
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5002
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5003
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5004
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5005
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5006
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5007
  LDI r14, 0
  STORE r8, r14
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r14, 5
  LDI r8, 0x5502
  STORE r8, r14
  LDI r14, 10920
  LDI r8, 0x5503
  STORE r8, r14
  LDI r14, 0x00AAFF
  LDI r8, 0x5504
  STORE r8, r14
  LDI r14, 3
  LDI r8, 0x5501
  STORE r8, r14
  RET

store_koch_f:
  LDI r8, 0x5100
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5101
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5102
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5103
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5104
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5105
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5106
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5107
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5108
  LDI r14, 0
  STORE r8, r14
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r14, 2
  LDI r8, 0x5500
  STORE r8, r14
  ; axiom: F-G-G
  LDI r8, 0x5000
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5001
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5002
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5003
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5004
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5005
  LDI r14, 0
  STORE r8, r14
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r8, 0x5100
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5101
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5102
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5103
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5104
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5105
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5106
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5107
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5108
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5109
  LDI r14, 0
  STORE r8, r14
  ; rule G -> GG (at 0x5200)
  LDI r8, 0x5200
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5201
  LDI r14, 71
  STORE r8, r14
  LDI r8, 0x5202
  LDI r14, 0
  STORE r8, r14
  ; params
  LDI r14, 5
  LDI r8, 0x5502
  STORE r8, r14
  LDI r14, 21840
  LDI r8, 0x5503
  STORE r8, r14
  LDI r14, 0xFF6644
  LDI r8, 0x5504
  STORE r8, r14
  LDI r14, 5
  LDI r8, 0x5501
  STORE r8, r14
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r14, 3
  LDI r8, 0x5500
  STORE r8, r14
  ; axiom: FX
  LDI r8, 0x5000
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5001
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5002
  LDI r14, 0
  STORE r8, r14
  ; rule X -> X+YF+ (at 0x5300)
  LDI r8, 0x5300
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5301
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5302
  LDI r14, 89
  STORE r8, r14
  LDI r8, 0x5303
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5304
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5305
  LDI r14, 0
  STORE r8, r14
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r8, 0x5400
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5401
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5402
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5403
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5404
  LDI r14, 89
  STORE r8, r14
  LDI r8, 0x5405
  LDI r14, 0
  STORE r8, r14
  ; params
  LDI r14, 4
  LDI r8, 0x5502
  STORE r8, r14
  LDI r14, 16380
  LDI r8, 0x5503
  STORE r8, r14
  LDI r14, 0xFF2244
  LDI r8, 0x5504
  STORE r8, r14
  LDI r14, 8
  LDI r8, 0x5501
  STORE r8, r14
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r14, 4
  LDI r8, 0x5500
  STORE r8, r14
  ; axiom: X
  LDI r8, 0x5000
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5001
  LDI r14, 0
  STORE r8, r14
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r8, 0x5300
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5301
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5302
  LDI r14, 91
  STORE r8, r14
  LDI r8, 0x5303
  LDI r14, 91
  STORE r8, r14
  LDI r8, 0x5304
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5305
  LDI r14, 93
  STORE r8, r14
  LDI r8, 0x5306
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5307
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5308
  LDI r14, 93
  STORE r8, r14
  LDI r8, 0x5309
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x530A
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x530B
  LDI r14, 91
  STORE r8, r14
  LDI r8, 0x530C
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x530D
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x530E
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x530F
  LDI r14, 93
  STORE r8, r14
  LDI r8, 0x5310
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5311
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5312
  LDI r14, 0
  STORE r8, r14
  ; rule F -> FF (at 0x5100)
  LDI r8, 0x5100
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5101
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5102
  LDI r14, 0
  STORE r8, r14
  ; params
  LDI r14, 3
  LDI r8, 0x5502
  STORE r8, r14
  LDI r14, 4550
  LDI r8, 0x5503
  STORE r8, r14
  LDI r14, 0x22CC44
  LDI r8, 0x5504
  STORE r8, r14
  LDI r14, 4
  LDI r8, 0x5501
  STORE r8, r14
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r14, 5
  LDI r8, 0x5500
  STORE r8, r14
  ; axiom: X
  LDI r8, 0x5000
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5001
  LDI r14, 0
  STORE r8, r14
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r8, 0x5300
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5301
  LDI r14, 91
  STORE r8, r14
  LDI r8, 0x5302
  LDI r14, 43
  STORE r8, r14
  LDI r8, 0x5303
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5304
  LDI r14, 93
  STORE r8, r14
  LDI r8, 0x5305
  LDI r14, 91
  STORE r8, r14
  LDI r8, 0x5306
  LDI r14, 45
  STORE r8, r14
  LDI r8, 0x5307
  LDI r14, 88
  STORE r8, r14
  LDI r8, 0x5308
  LDI r14, 93
  STORE r8, r14
  LDI r8, 0x5309
  LDI r14, 0
  STORE r8, r14
  ; rule F -> FF (at 0x5100)
  LDI r8, 0x5100
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5101
  LDI r14, 70
  STORE r8, r14
  LDI r8, 0x5102
  LDI r14, 0
  STORE r8, r14
  ; params
  LDI r14, 4
  LDI r8, 0x5502
  STORE r8, r14
  LDI r14, 5460
  LDI r8, 0x5503
  STORE r8, r14
  LDI r14, 0x44AA22
  LDI r8, 0x5504
  STORE r8, r14
  LDI r14, 5
  LDI r8, 0x5501
  STORE r8, r14
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r9, 0x5000
  LDI r1, 0x2000
copy_axiom_lp:
  LDI r12, 0
  ADD r12, r9
  LOAD r10, r12
  JZ r10, axiom_copied
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10
  LDI r10, 1
  ADD r9, r10
  ADD r1, r10
  JMP copy_axiom_lp
axiom_copied:
  LDI r10, 0
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10

  ; get iteration count
  LDI r13, 0
  LDI r4, 0x5501
  LOAD r4, r4

expand_iter_lp:
  CMP r13, r4
  BGE r0, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r9, 0x2000
  LDI r1, 0x3000
exp_char_lp:
  LDI r12, 0
  ADD r12, r9
  LOAD r10, r12
  JZ r10, exp_copy_back

  ; check F
  LDI r12, 70
  CMP r10, r12
  JZ r0, exp_f
  ; check G
  LDI r12, 71
  CMP r10, r12
  JZ r0, exp_g
  ; check X
  LDI r12, 88
  CMP r10, r12
  JZ r0, exp_x
  ; check Y
  LDI r12, 89
  CMP r10, r12
  JZ r0, exp_y

  ; no rule -- copy char directly
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10
  LDI r10, 1
  ADD r1, r10
  LDI r10, 1
  ADD r9, r10
  JMP exp_char_lp

exp_f:
  LDI r10, 1
  ADD r9, r10
  LDI r10, 0x5100
  LDI r12, 0x5505
  STORE r12, r10
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r10, 1
  ADD r9, r10
  LDI r10, 0x5200
  LDI r12, 0x5505
  STORE r12, r10
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r10, 1
  ADD r9, r10
  LDI r10, 0x5300
  LDI r12, 0x5505
  STORE r12, r10
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r10, 1
  ADD r9, r10
  LDI r10, 0x5400
  LDI r12, 0x5505
  STORE r12, r10
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r10, 0
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10
  ; overflow check
  LDI r12, 0x3FFF
  CMP r1, r12
  BGE r0, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r9, 0x3000
  LDI r1, 0x2000
cp_back_lp:
  LDI r12, 0
  ADD r12, r9
  LOAD r10, r12
  JZ r10, cp_back_done
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10
  LDI r10, 1
  ADD r9, r10
  ADD r1, r10
  JMP cp_back_lp
cp_back_done:
  LDI r10, 0
  LDI r12, 0
  ADD r12, r1
  STORE r12, r10
  LDI r10, 1
  ADD r13, r10
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r1
; Advances r1 past copied chars
copy_rule:
  LDI r12, 0x5505
  LOAD r18, r12      ; r18 = rule base address
cp_rule_lp:
  LDI r12, 0
  ADD r12, r18
  LOAD r19, r12      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r12, 0
  ADD r12, r1
  STORE r12, r19
  LDI r19, 1
  ADD r1, r19
  ADD r18, r19
  JMP cp_rule_lp
cp_rule_done:
  RET

; ==== Turtle Graphics Renderer ====
; Reads expanded string from 0x3000, draws with LINE
do_render:
  PUSH r31
  LDI r21, 0
  FILL r21

  ; init turtle
  LDI r9, 128
  LDI r1, 128
  LDI r12, 0

  ; load params
  LDI r8, 0x5504
  LOAD r13, r8       ; color
  LDI r8, 0x5503
  LOAD r4, r8       ; angle increment
  LDI r8, 0x5502
  LOAD r16, r8       ; line length

  ; position adjustments per preset
  LDI r8, 0x5500
  LOAD r17, r8
  LDI r18, 1
  CMP r17, r18
  JZ r0, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r0, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r0, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r0, pos_fern
  ; preset 5 tree
  LDI r1, 240
  LDI r12, 54600
  JMP pos_done

pos_koch:
  LDI r9, 20
  LDI r1, 180
  LDI r12, 54600
  JMP pos_done
pos_sierp:
  LDI r9, 30
  LDI r1, 200
  LDI r12, 0
  JMP pos_done
pos_drag:
  LDI r9, 128
  LDI r1, 128
  LDI r12, 0
  JMP pos_done
pos_fern:
  LDI r9, 128
  LDI r1, 240
  LDI r12, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r8, 0
  ADD r8, r20
  LOAD r11, r8
  JZ r11, turtle_done

  ; F = forward + draw
  LDI r8, 70
  CMP r11, r8
  JZ r0, t_fwd
  ; G = forward no draw
  LDI r8, 71
  CMP r11, r8
  JZ r0, t_move
  ; + = turn left
  LDI r8, 43
  CMP r11, r8
  JZ r0, t_left
  ; - = turn right
  LDI r8, 45
  CMP r11, r8
  JZ r0, t_right
  ; [ = push
  LDI r8, 91
  CMP r11, r8
  JZ r0, t_push
  ; ] = pop
  LDI r8, 93
  CMP r11, r8
  JZ r0, t_pop

  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r9, r1, r21, r22, r13
  MOV r9, r21
  MOV r1, r22
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r9, r21
  MOV r1, r22
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_left:
  ADD r12, r4
  LDI r8, 65536
  CMP r12, r8
  BLT r0, t_left_done
  SUB r12, r8
t_left_done:
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_right:
  SUB r12, r4
  ; If angle underflowed (bit 31 set), add 65536
  LDI r8, 31
  MOV r23, r12
  SHR r23, r8       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r8, 65536
  ADD r12, r8
t_right_done:
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_push:
  PUSH r9
  PUSH r1
  PUSH r12
  PUSH r31
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

t_pop:
  POP r31
  POP r12
  POP r1
  POP r9
  LDI r8, 1
  ADD r20, r8
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r9=x, r1=y, r12=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r12
  LDI r22, 13
  SHR r21, r22

  ; load cos_table[sector]
  LDI r23, 0x7000
  ADD r23, r21
  LOAD r24, r23
  ; load sin_table[sector]
  LDI r23, 0x7010
  ADD r23, r21
  LOAD r25, r23

  ; x1 = x + (length * cos) / 256
  MOV r21, r16
  MUL r21, r24
  LDI r23, 256
  DIV r21, r23
  ADD r21, r9

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r1

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r8, 0x5504
  LOAD r11, r8
  LDI r14, 0
  LDI r8, 0
  LDI r7, 256
  LDI r6, 6
  RECTF r14, r8, r7, r6, r11
  ; iteration dots
  LDI r8, 0x5501
  LOAD r9, r8
  LDI r14, 0
  LDI r8, 12
  LDI r7, 10
info_lp:
  CMP r14, r9
  BGE r0, info_done
  PSET r14, r8, r11
  ADD r14, r7
  JMP info_lp
info_done:
  POP r31
  RET
