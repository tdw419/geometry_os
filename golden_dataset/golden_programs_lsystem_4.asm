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
  IKEY r4
  JZ r4, main_loop

  ; key 1
  LDI r9, 49
  CMP r4, r9
  JZ r7, key_1
  ; key 2
  LDI r9, 50
  CMP r4, r9
  JZ r7, key_2
  ; key 3
  LDI r9, 51
  CMP r4, r9
  JZ r7, key_3
  ; key 4
  LDI r9, 52
  CMP r4, r9
  JZ r7, key_4
  ; key 5
  LDI r9, 53
  CMP r4, r9
  JZ r7, key_5
  ; + or =
  LDI r9, 43
  CMP r4, r9
  JZ r7, key_plus
  LDI r9, 61
  CMP r4, r9
  JZ r7, key_plus
  ; - or _
  LDI r9, 45
  CMP r4, r9
  JZ r7, key_minus
  LDI r9, 95
  CMP r4, r9
  JZ r7, key_minus

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
  LDI r2, 0x5501
  LOAD r12, r2
  LDI r1, 8
  CMP r12, r1
  BGE r7, main_loop
  LDI r1, 1
  ADD r12, r1
  STORE r2, r12
  JMP key_regen
key_minus:
  LDI r2, 0x5501
  LOAD r12, r2
  LDI r1, 1
  CMP r12, r1
  BLT r7, main_loop
  LDI r1, 1
  SUB r12, r1
  STORE r2, r12
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
  LDI r2, 0x7000
  LDI r0, 256
  STORE r2, r0
  LDI r2, 0x7001
  LDI r0, 181
  STORE r2, r0
  LDI r2, 0x7002
  LDI r0, 0
  STORE r2, r0
  LDI r2, 0x7003
  LDI r0, 0xFFFF73
  STORE r2, r0
  LDI r2, 0x7004
  LDI r0, 0xFFFFFF00
  STORE r2, r0
  LDI r2, 0x7005
  LDI r0, 0xFFFF73
  STORE r2, r0
  LDI r2, 0x7006
  LDI r0, 0
  STORE r2, r0
  LDI r2, 0x7007
  LDI r0, 181
  STORE r2, r0
  ; sin_table at 0x7010
  LDI r2, 0x7010
  LDI r0, 0
  STORE r2, r0
  LDI r2, 0x7011
  LDI r0, 181
  STORE r2, r0
  LDI r2, 0x7012
  LDI r0, 256
  STORE r2, r0
  LDI r2, 0x7013
  LDI r0, 181
  STORE r2, r0
  LDI r2, 0x7014
  LDI r0, 0
  STORE r2, r0
  LDI r2, 0x7015
  LDI r0, 0xFFFF73
  STORE r2, r0
  LDI r2, 0x7016
  LDI r0, 0xFFFFFF00
  STORE r2, r0
  LDI r2, 0x7017
  LDI r0, 0xFFFF73
  STORE r2, r0
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r0, 1
  LDI r2, 0x5500
  STORE r2, r0
  ; axiom: F--F--F (at 0x5000)
  LDI r2, 0x5000
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5001
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5002
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5003
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5004
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5005
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5006
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5007
  LDI r0, 0
  STORE r2, r0
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r0, 5
  LDI r2, 0x5502
  STORE r2, r0
  LDI r0, 10920
  LDI r2, 0x5503
  STORE r2, r0
  LDI r0, 0x00AAFF
  LDI r2, 0x5504
  STORE r2, r0
  LDI r0, 3
  LDI r2, 0x5501
  STORE r2, r0
  RET

store_koch_f:
  LDI r2, 0x5100
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5101
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5102
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5103
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5104
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5105
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5106
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5107
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5108
  LDI r0, 0
  STORE r2, r0
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r0, 2
  LDI r2, 0x5500
  STORE r2, r0
  ; axiom: F-G-G
  LDI r2, 0x5000
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5001
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5002
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5003
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5004
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5005
  LDI r0, 0
  STORE r2, r0
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r2, 0x5100
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5101
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5102
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5103
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5104
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5105
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5106
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5107
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5108
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5109
  LDI r0, 0
  STORE r2, r0
  ; rule G -> GG (at 0x5200)
  LDI r2, 0x5200
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5201
  LDI r0, 71
  STORE r2, r0
  LDI r2, 0x5202
  LDI r0, 0
  STORE r2, r0
  ; params
  LDI r0, 5
  LDI r2, 0x5502
  STORE r2, r0
  LDI r0, 21840
  LDI r2, 0x5503
  STORE r2, r0
  LDI r0, 0xFF6644
  LDI r2, 0x5504
  STORE r2, r0
  LDI r0, 5
  LDI r2, 0x5501
  STORE r2, r0
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r0, 3
  LDI r2, 0x5500
  STORE r2, r0
  ; axiom: FX
  LDI r2, 0x5000
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5001
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5002
  LDI r0, 0
  STORE r2, r0
  ; rule X -> X+YF+ (at 0x5300)
  LDI r2, 0x5300
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5301
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5302
  LDI r0, 89
  STORE r2, r0
  LDI r2, 0x5303
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5304
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5305
  LDI r0, 0
  STORE r2, r0
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r2, 0x5400
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5401
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5402
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5403
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5404
  LDI r0, 89
  STORE r2, r0
  LDI r2, 0x5405
  LDI r0, 0
  STORE r2, r0
  ; params
  LDI r0, 4
  LDI r2, 0x5502
  STORE r2, r0
  LDI r0, 16380
  LDI r2, 0x5503
  STORE r2, r0
  LDI r0, 0xFF2244
  LDI r2, 0x5504
  STORE r2, r0
  LDI r0, 8
  LDI r2, 0x5501
  STORE r2, r0
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r0, 4
  LDI r2, 0x5500
  STORE r2, r0
  ; axiom: X
  LDI r2, 0x5000
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5001
  LDI r0, 0
  STORE r2, r0
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r2, 0x5300
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5301
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5302
  LDI r0, 91
  STORE r2, r0
  LDI r2, 0x5303
  LDI r0, 91
  STORE r2, r0
  LDI r2, 0x5304
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5305
  LDI r0, 93
  STORE r2, r0
  LDI r2, 0x5306
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5307
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5308
  LDI r0, 93
  STORE r2, r0
  LDI r2, 0x5309
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x530A
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x530B
  LDI r0, 91
  STORE r2, r0
  LDI r2, 0x530C
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x530D
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x530E
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x530F
  LDI r0, 93
  STORE r2, r0
  LDI r2, 0x5310
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5311
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5312
  LDI r0, 0
  STORE r2, r0
  ; rule F -> FF (at 0x5100)
  LDI r2, 0x5100
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5101
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5102
  LDI r0, 0
  STORE r2, r0
  ; params
  LDI r0, 3
  LDI r2, 0x5502
  STORE r2, r0
  LDI r0, 4550
  LDI r2, 0x5503
  STORE r2, r0
  LDI r0, 0x22CC44
  LDI r2, 0x5504
  STORE r2, r0
  LDI r0, 4
  LDI r2, 0x5501
  STORE r2, r0
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r0, 5
  LDI r2, 0x5500
  STORE r2, r0
  ; axiom: X
  LDI r2, 0x5000
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5001
  LDI r0, 0
  STORE r2, r0
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r2, 0x5300
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5301
  LDI r0, 91
  STORE r2, r0
  LDI r2, 0x5302
  LDI r0, 43
  STORE r2, r0
  LDI r2, 0x5303
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5304
  LDI r0, 93
  STORE r2, r0
  LDI r2, 0x5305
  LDI r0, 91
  STORE r2, r0
  LDI r2, 0x5306
  LDI r0, 45
  STORE r2, r0
  LDI r2, 0x5307
  LDI r0, 88
  STORE r2, r0
  LDI r2, 0x5308
  LDI r0, 93
  STORE r2, r0
  LDI r2, 0x5309
  LDI r0, 0
  STORE r2, r0
  ; rule F -> FF (at 0x5100)
  LDI r2, 0x5100
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5101
  LDI r0, 70
  STORE r2, r0
  LDI r2, 0x5102
  LDI r0, 0
  STORE r2, r0
  ; params
  LDI r0, 4
  LDI r2, 0x5502
  STORE r2, r0
  LDI r0, 5460
  LDI r2, 0x5503
  STORE r2, r0
  LDI r0, 0x44AA22
  LDI r2, 0x5504
  STORE r2, r0
  LDI r0, 5
  LDI r2, 0x5501
  STORE r2, r0
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r4, 0x5000
  LDI r9, 0x2000
copy_axiom_lp:
  LDI r8, 0
  ADD r8, r4
  LOAD r6, r8
  JZ r6, axiom_copied
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6
  LDI r6, 1
  ADD r4, r6
  ADD r9, r6
  JMP copy_axiom_lp
axiom_copied:
  LDI r6, 0
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6

  ; get iteration count
  LDI r5, 0
  LDI r11, 0x5501
  LOAD r11, r11

expand_iter_lp:
  CMP r5, r11
  BGE r7, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r4, 0x2000
  LDI r9, 0x3000
exp_char_lp:
  LDI r8, 0
  ADD r8, r4
  LOAD r6, r8
  JZ r6, exp_copy_back

  ; check F
  LDI r8, 70
  CMP r6, r8
  JZ r7, exp_f
  ; check G
  LDI r8, 71
  CMP r6, r8
  JZ r7, exp_g
  ; check X
  LDI r8, 88
  CMP r6, r8
  JZ r7, exp_x
  ; check Y
  LDI r8, 89
  CMP r6, r8
  JZ r7, exp_y

  ; no rule -- copy char directly
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6
  LDI r6, 1
  ADD r9, r6
  LDI r6, 1
  ADD r4, r6
  JMP exp_char_lp

exp_f:
  LDI r6, 1
  ADD r4, r6
  LDI r6, 0x5100
  LDI r8, 0x5505
  STORE r8, r6
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r6, 1
  ADD r4, r6
  LDI r6, 0x5200
  LDI r8, 0x5505
  STORE r8, r6
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r6, 1
  ADD r4, r6
  LDI r6, 0x5300
  LDI r8, 0x5505
  STORE r8, r6
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r6, 1
  ADD r4, r6
  LDI r6, 0x5400
  LDI r8, 0x5505
  STORE r8, r6
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r6, 0
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6
  ; overflow check
  LDI r8, 0x3FFF
  CMP r9, r8
  BGE r7, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r4, 0x3000
  LDI r9, 0x2000
cp_back_lp:
  LDI r8, 0
  ADD r8, r4
  LOAD r6, r8
  JZ r6, cp_back_done
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6
  LDI r6, 1
  ADD r4, r6
  ADD r9, r6
  JMP cp_back_lp
cp_back_done:
  LDI r6, 0
  LDI r8, 0
  ADD r8, r9
  STORE r8, r6
  LDI r6, 1
  ADD r5, r6
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r9
; Advances r9 past copied chars
copy_rule:
  LDI r8, 0x5505
  LOAD r18, r8      ; r18 = rule base address
cp_rule_lp:
  LDI r8, 0
  ADD r8, r18
  LOAD r19, r8      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r8, 0
  ADD r8, r9
  STORE r8, r19
  LDI r19, 1
  ADD r9, r19
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
  LDI r4, 128
  LDI r9, 128
  LDI r8, 0

  ; load params
  LDI r2, 0x5504
  LOAD r5, r2       ; color
  LDI r2, 0x5503
  LOAD r11, r2       ; angle increment
  LDI r2, 0x5502
  LOAD r16, r2       ; line length

  ; position adjustments per preset
  LDI r2, 0x5500
  LOAD r17, r2
  LDI r18, 1
  CMP r17, r18
  JZ r7, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r7, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r7, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r7, pos_fern
  ; preset 5 tree
  LDI r9, 240
  LDI r8, 54600
  JMP pos_done

pos_koch:
  LDI r4, 20
  LDI r9, 180
  LDI r8, 54600
  JMP pos_done
pos_sierp:
  LDI r4, 30
  LDI r9, 200
  LDI r8, 0
  JMP pos_done
pos_drag:
  LDI r4, 128
  LDI r9, 128
  LDI r8, 0
  JMP pos_done
pos_fern:
  LDI r4, 128
  LDI r9, 240
  LDI r8, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r2, 0
  ADD r2, r20
  LOAD r12, r2
  JZ r12, turtle_done

  ; F = forward + draw
  LDI r2, 70
  CMP r12, r2
  JZ r7, t_fwd
  ; G = forward no draw
  LDI r2, 71
  CMP r12, r2
  JZ r7, t_move
  ; + = turn left
  LDI r2, 43
  CMP r12, r2
  JZ r7, t_left
  ; - = turn right
  LDI r2, 45
  CMP r12, r2
  JZ r7, t_right
  ; [ = push
  LDI r2, 91
  CMP r12, r2
  JZ r7, t_push
  ; ] = pop
  LDI r2, 93
  CMP r12, r2
  JZ r7, t_pop

  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r4, r9, r21, r22, r5
  MOV r4, r21
  MOV r9, r22
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r4, r21
  MOV r9, r22
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_left:
  ADD r8, r11
  LDI r2, 65536
  CMP r8, r2
  BLT r7, t_left_done
  SUB r8, r2
t_left_done:
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_right:
  SUB r8, r11
  ; If angle underflowed (bit 31 set), add 65536
  LDI r2, 31
  MOV r23, r8
  SHR r23, r2       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r2, 65536
  ADD r8, r2
t_right_done:
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_push:
  PUSH r4
  PUSH r9
  PUSH r8
  PUSH r31
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

t_pop:
  POP r31
  POP r8
  POP r9
  POP r4
  LDI r2, 1
  ADD r20, r2
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r4=x, r9=y, r8=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r8
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
  ADD r21, r4

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r9

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r2, 0x5504
  LOAD r12, r2
  LDI r0, 0
  LDI r2, 0
  LDI r1, 256
  LDI r3, 6
  RECTF r0, r2, r1, r3, r12
  ; iteration dots
  LDI r2, 0x5501
  LOAD r4, r2
  LDI r0, 0
  LDI r2, 12
  LDI r1, 10
info_lp:
  CMP r0, r4
  BGE r7, info_done
  PSET r0, r2, r12
  ADD r0, r1
  JMP info_lp
info_done:
  POP r31
  RET
