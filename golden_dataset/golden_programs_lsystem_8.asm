; DESCRIPTION: A colored object centered at the screen with fixed size.

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
  IKEY r7
  JZ r7, main_loop

  ; key 1
  LDI r8, 49
  CMP r7, r8
  JZ r9, key_1
  ; key 2
  LDI r8, 50
  CMP r7, r8
  JZ r9, key_2
  ; key 3
  LDI r8, 51
  CMP r7, r8
  JZ r9, key_3
  ; key 4
  LDI r8, 52
  CMP r7, r8
  JZ r9, key_4
  ; key 5
  LDI r8, 53
  CMP r7, r8
  JZ r9, key_5
  ; + or =
  LDI r8, 43
  CMP r7, r8
  JZ r9, key_plus
  LDI r8, 61
  CMP r7, r8
  JZ r9, key_plus
  ; - or _
  LDI r8, 45
  CMP r7, r8
  JZ r9, key_minus
  LDI r8, 95
  CMP r7, r8
  JZ r9, key_minus

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
  LDI r15, 0x5501
  LOAD r14, r15
  LDI r4, 8
  CMP r14, r4
  BGE r9, main_loop
  LDI r4, 1
  ADD r14, r4
  STORE r15, r14
  JMP key_regen
key_minus:
  LDI r15, 0x5501
  LOAD r14, r15
  LDI r4, 1
  CMP r14, r4
  BLT r9, main_loop
  LDI r4, 1
  SUB r14, r4
  STORE r15, r14
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
  LDI r15, 0x7000
  LDI r1, 256
  STORE r15, r1
  LDI r15, 0x7001
  LDI r1, 181
  STORE r15, r1
  LDI r15, 0x7002
  LDI r1, 0
  STORE r15, r1
  LDI r15, 0x7003
  LDI r1, 0xFFFF73
  STORE r15, r1
  LDI r15, 0x7004
  LDI r1, 0xFFFFFF00
  STORE r15, r1
  LDI r15, 0x7005
  LDI r1, 0xFFFF73
  STORE r15, r1
  LDI r15, 0x7006
  LDI r1, 0
  STORE r15, r1
  LDI r15, 0x7007
  LDI r1, 181
  STORE r15, r1
  ; sin_table at 0x7010
  LDI r15, 0x7010
  LDI r1, 0
  STORE r15, r1
  LDI r15, 0x7011
  LDI r1, 181
  STORE r15, r1
  LDI r15, 0x7012
  LDI r1, 256
  STORE r15, r1
  LDI r15, 0x7013
  LDI r1, 181
  STORE r15, r1
  LDI r15, 0x7014
  LDI r1, 0
  STORE r15, r1
  LDI r15, 0x7015
  LDI r1, 0xFFFF73
  STORE r15, r1
  LDI r15, 0x7016
  LDI r1, 0xFFFFFF00
  STORE r15, r1
  LDI r15, 0x7017
  LDI r1, 0xFFFF73
  STORE r15, r1
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r1, 1
  LDI r15, 0x5500
  STORE r15, r1
  ; axiom: F--F--F (at 0x5000)
  LDI r15, 0x5000
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5001
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5002
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5003
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5004
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5005
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5006
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5007
  LDI r1, 0
  STORE r15, r1
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r1, 5
  LDI r15, 0x5502
  STORE r15, r1
  LDI r1, 10920
  LDI r15, 0x5503
  STORE r15, r1
  LDI r1, 0x00AAFF
  LDI r15, 0x5504
  STORE r15, r1
  LDI r1, 3
  LDI r15, 0x5501
  STORE r15, r1
  RET

store_koch_f:
  LDI r15, 0x5100
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5101
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5102
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5103
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5104
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5105
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5106
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5107
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5108
  LDI r1, 0
  STORE r15, r1
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r1, 2
  LDI r15, 0x5500
  STORE r15, r1
  ; axiom: F-G-G
  LDI r15, 0x5000
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5001
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5002
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5003
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5004
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5005
  LDI r1, 0
  STORE r15, r1
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r15, 0x5100
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5101
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5102
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5103
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5104
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5105
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5106
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5107
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5108
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5109
  LDI r1, 0
  STORE r15, r1
  ; rule G -> GG (at 0x5200)
  LDI r15, 0x5200
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5201
  LDI r1, 71
  STORE r15, r1
  LDI r15, 0x5202
  LDI r1, 0
  STORE r15, r1
  ; params
  LDI r1, 5
  LDI r15, 0x5502
  STORE r15, r1
  LDI r1, 21840
  LDI r15, 0x5503
  STORE r15, r1
  LDI r1, 0xFF6644
  LDI r15, 0x5504
  STORE r15, r1
  LDI r1, 5
  LDI r15, 0x5501
  STORE r15, r1
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r1, 3
  LDI r15, 0x5500
  STORE r15, r1
  ; axiom: FX
  LDI r15, 0x5000
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5001
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5002
  LDI r1, 0
  STORE r15, r1
  ; rule X -> X+YF+ (at 0x5300)
  LDI r15, 0x5300
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5301
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5302
  LDI r1, 89
  STORE r15, r1
  LDI r15, 0x5303
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5304
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5305
  LDI r1, 0
  STORE r15, r1
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r15, 0x5400
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5401
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5402
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5403
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5404
  LDI r1, 89
  STORE r15, r1
  LDI r15, 0x5405
  LDI r1, 0
  STORE r15, r1
  ; params
  LDI r1, 4
  LDI r15, 0x5502
  STORE r15, r1
  LDI r1, 16380
  LDI r15, 0x5503
  STORE r15, r1
  LDI r1, 0xFF2244
  LDI r15, 0x5504
  STORE r15, r1
  LDI r1, 8
  LDI r15, 0x5501
  STORE r15, r1
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r1, 4
  LDI r15, 0x5500
  STORE r15, r1
  ; axiom: X
  LDI r15, 0x5000
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5001
  LDI r1, 0
  STORE r15, r1
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r15, 0x5300
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5301
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5302
  LDI r1, 91
  STORE r15, r1
  LDI r15, 0x5303
  LDI r1, 91
  STORE r15, r1
  LDI r15, 0x5304
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5305
  LDI r1, 93
  STORE r15, r1
  LDI r15, 0x5306
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5307
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5308
  LDI r1, 93
  STORE r15, r1
  LDI r15, 0x5309
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x530A
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x530B
  LDI r1, 91
  STORE r15, r1
  LDI r15, 0x530C
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x530D
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x530E
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x530F
  LDI r1, 93
  STORE r15, r1
  LDI r15, 0x5310
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5311
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5312
  LDI r1, 0
  STORE r15, r1
  ; rule F -> FF (at 0x5100)
  LDI r15, 0x5100
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5101
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5102
  LDI r1, 0
  STORE r15, r1
  ; params
  LDI r1, 3
  LDI r15, 0x5502
  STORE r15, r1
  LDI r1, 4550
  LDI r15, 0x5503
  STORE r15, r1
  LDI r1, 0x22CC44
  LDI r15, 0x5504
  STORE r15, r1
  LDI r1, 4
  LDI r15, 0x5501
  STORE r15, r1
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r1, 5
  LDI r15, 0x5500
  STORE r15, r1
  ; axiom: X
  LDI r15, 0x5000
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5001
  LDI r1, 0
  STORE r15, r1
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r15, 0x5300
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5301
  LDI r1, 91
  STORE r15, r1
  LDI r15, 0x5302
  LDI r1, 43
  STORE r15, r1
  LDI r15, 0x5303
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5304
  LDI r1, 93
  STORE r15, r1
  LDI r15, 0x5305
  LDI r1, 91
  STORE r15, r1
  LDI r15, 0x5306
  LDI r1, 45
  STORE r15, r1
  LDI r15, 0x5307
  LDI r1, 88
  STORE r15, r1
  LDI r15, 0x5308
  LDI r1, 93
  STORE r15, r1
  LDI r15, 0x5309
  LDI r1, 0
  STORE r15, r1
  ; rule F -> FF (at 0x5100)
  LDI r15, 0x5100
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5101
  LDI r1, 70
  STORE r15, r1
  LDI r15, 0x5102
  LDI r1, 0
  STORE r15, r1
  ; params
  LDI r1, 4
  LDI r15, 0x5502
  STORE r15, r1
  LDI r1, 5460
  LDI r15, 0x5503
  STORE r15, r1
  LDI r1, 0x44AA22
  LDI r15, 0x5504
  STORE r15, r1
  LDI r1, 5
  LDI r15, 0x5501
  STORE r15, r1
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r7, 0x5000
  LDI r8, 0x2000
copy_axiom_lp:
  LDI r10, 0
  ADD r10, r7
  LOAD r13, r10
  JZ r13, axiom_copied
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13
  LDI r13, 1
  ADD r7, r13
  ADD r8, r13
  JMP copy_axiom_lp
axiom_copied:
  LDI r13, 0
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13

  ; get iteration count
  LDI r3, 0
  LDI r12, 0x5501
  LOAD r12, r12

expand_iter_lp:
  CMP r3, r12
  BGE r9, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r7, 0x2000
  LDI r8, 0x3000
exp_char_lp:
  LDI r10, 0
  ADD r10, r7
  LOAD r13, r10
  JZ r13, exp_copy_back

  ; check F
  LDI r10, 70
  CMP r13, r10
  JZ r9, exp_f
  ; check G
  LDI r10, 71
  CMP r13, r10
  JZ r9, exp_g
  ; check X
  LDI r10, 88
  CMP r13, r10
  JZ r9, exp_x
  ; check Y
  LDI r10, 89
  CMP r13, r10
  JZ r9, exp_y

  ; no rule -- copy char directly
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13
  LDI r13, 1
  ADD r8, r13
  LDI r13, 1
  ADD r7, r13
  JMP exp_char_lp

exp_f:
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0x5100
  LDI r10, 0x5505
  STORE r10, r13
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0x5200
  LDI r10, 0x5505
  STORE r10, r13
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0x5300
  LDI r10, 0x5505
  STORE r10, r13
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0x5400
  LDI r10, 0x5505
  STORE r10, r13
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r13, 0
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13
  ; overflow check
  LDI r10, 0x3FFF
  CMP r8, r10
  BGE r9, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r7, 0x3000
  LDI r8, 0x2000
cp_back_lp:
  LDI r10, 0
  ADD r10, r7
  LOAD r13, r10
  JZ r13, cp_back_done
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13
  LDI r13, 1
  ADD r7, r13
  ADD r8, r13
  JMP cp_back_lp
cp_back_done:
  LDI r13, 0
  LDI r10, 0
  ADD r10, r8
  STORE r10, r13
  LDI r13, 1
  ADD r3, r13
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r8
; Advances r8 past copied chars
copy_rule:
  LDI r10, 0x5505
  LOAD r18, r10      ; r18 = rule base address
cp_rule_lp:
  LDI r10, 0
  ADD r10, r18
  LOAD r19, r10      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r10, 0
  ADD r10, r8
  STORE r10, r19
  LDI r19, 1
  ADD r8, r19
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
  LDI r7, 128
  LDI r8, 128
  LDI r10, 0

  ; load params
  LDI r15, 0x5504
  LOAD r3, r15       ; color
  LDI r15, 0x5503
  LOAD r12, r15       ; angle increment
  LDI r15, 0x5502
  LOAD r16, r15       ; line length

  ; position adjustments per preset
  LDI r15, 0x5500
  LOAD r17, r15
  LDI r18, 1
  CMP r17, r18
  JZ r9, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r9, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r9, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r9, pos_fern
  ; preset 5 tree
  LDI r8, 240
  LDI r10, 54600
  JMP pos_done

pos_koch:
  LDI r7, 20
  LDI r8, 180
  LDI r10, 54600
  JMP pos_done
pos_sierp:
  LDI r7, 30
  LDI r8, 200
  LDI r10, 0
  JMP pos_done
pos_drag:
  LDI r7, 128
  LDI r8, 128
  LDI r10, 0
  JMP pos_done
pos_fern:
  LDI r7, 128
  LDI r8, 240
  LDI r10, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r15, 0
  ADD r15, r20
  LOAD r14, r15
  JZ r14, turtle_done

  ; F = forward + draw
  LDI r15, 70
  CMP r14, r15
  JZ r9, t_fwd
  ; G = forward no draw
  LDI r15, 71
  CMP r14, r15
  JZ r9, t_move
  ; + = turn left
  LDI r15, 43
  CMP r14, r15
  JZ r9, t_left
  ; - = turn right
  LDI r15, 45
  CMP r14, r15
  JZ r9, t_right
  ; [ = push
  LDI r15, 91
  CMP r14, r15
  JZ r9, t_push
  ; ] = pop
  LDI r15, 93
  CMP r14, r15
  JZ r9, t_pop

  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r7, r8, r21, r22, r3
  MOV r7, r21
  MOV r8, r22
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r7, r21
  MOV r8, r22
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_left:
  ADD r10, r12
  LDI r15, 65536
  CMP r10, r15
  BLT r9, t_left_done
  SUB r10, r15
t_left_done:
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_right:
  SUB r10, r12
  ; If angle underflowed (bit 31 set), add 65536
  LDI r15, 31
  MOV r23, r10
  SHR r23, r15       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r15, 65536
  ADD r10, r15
t_right_done:
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_push:
  PUSH r7
  PUSH r8
  PUSH r10
  PUSH r31
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

t_pop:
  POP r31
  POP r10
  POP r8
  POP r7
  LDI r15, 1
  ADD r20, r15
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r7=x, r8=y, r10=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r10
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
  ADD r21, r7

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r8

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r15, 0x5504
  LOAD r14, r15
  LDI r1, 0
  LDI r15, 0
  LDI r4, 256
  LDI r6, 6
  RECTF r1, r15, r4, r6, r14
  ; iteration dots
  LDI r15, 0x5501
  LOAD r7, r15
  LDI r1, 0
  LDI r15, 12
  LDI r4, 10
info_lp:
  CMP r1, r7
  BGE r9, info_done
  PSET r1, r15, r14
  ADD r1, r4
  JMP info_lp
info_done:
  POP r31
  RET
