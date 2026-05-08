; DESCRIPTION: This GeOS assembly code implements an interactive fractal renderer that generates and displays L-system fractals based on user input. It supports five preset fractal patterns (Koch Snowflake, Sierpinski Triangle, Dragon Curve, Fern, and Tree) and allows users to switch between these presets and adjust the iteration count using keyboard inputs. The program uses a string expansion engine to generate fractal strings iteratively according to L-system rules and renders them using turtle graphics on a screen buffer.

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
  IKEY r13
  JZ r13, main_loop

  ; key 1
  LDI r0, 49
  CMP r13, r0
  JZ r11, key_1
  ; key 2
  LDI r0, 50
  CMP r13, r0
  JZ r11, key_2
  ; key 3
  LDI r0, 51
  CMP r13, r0
  JZ r11, key_3
  ; key 4
  LDI r0, 52
  CMP r13, r0
  JZ r11, key_4
  ; key 5
  LDI r0, 53
  CMP r13, r0
  JZ r11, key_5
  ; + or =
  LDI r0, 43
  CMP r13, r0
  JZ r11, key_plus
  LDI r0, 61
  CMP r13, r0
  JZ r11, key_plus
  ; - or _
  LDI r0, 45
  CMP r13, r0
  JZ r11, key_minus
  LDI r0, 95
  CMP r13, r0
  JZ r11, key_minus

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
  LDI r12, 0x5501
  LOAD r7, r12
  LDI r14, 8
  CMP r7, r14
  BGE r11, main_loop
  LDI r14, 1
  ADD r7, r14
  STORE r12, r7
  JMP key_regen
key_minus:
  LDI r12, 0x5501
  LOAD r7, r12
  LDI r14, 1
  CMP r7, r14
  BLT r11, main_loop
  LDI r14, 1
  SUB r7, r14
  STORE r12, r7
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
  LDI r12, 0x7000
  LDI r1, 256
  STORE r12, r1
  LDI r12, 0x7001
  LDI r1, 181
  STORE r12, r1
  LDI r12, 0x7002
  LDI r1, 0
  STORE r12, r1
  LDI r12, 0x7003
  LDI r1, 0xFFFF73
  STORE r12, r1
  LDI r12, 0x7004
  LDI r1, 0xFFFFFF00
  STORE r12, r1
  LDI r12, 0x7005
  LDI r1, 0xFFFF73
  STORE r12, r1
  LDI r12, 0x7006
  LDI r1, 0
  STORE r12, r1
  LDI r12, 0x7007
  LDI r1, 181
  STORE r12, r1
  ; sin_table at 0x7010
  LDI r12, 0x7010
  LDI r1, 0
  STORE r12, r1
  LDI r12, 0x7011
  LDI r1, 181
  STORE r12, r1
  LDI r12, 0x7012
  LDI r1, 256
  STORE r12, r1
  LDI r12, 0x7013
  LDI r1, 181
  STORE r12, r1
  LDI r12, 0x7014
  LDI r1, 0
  STORE r12, r1
  LDI r12, 0x7015
  LDI r1, 0xFFFF73
  STORE r12, r1
  LDI r12, 0x7016
  LDI r1, 0xFFFFFF00
  STORE r12, r1
  LDI r12, 0x7017
  LDI r1, 0xFFFF73
  STORE r12, r1
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r1, 1
  LDI r12, 0x5500
  STORE r12, r1
  ; axiom: F--F--F (at 0x5000)
  LDI r12, 0x5000
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5001
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5002
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5003
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5004
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5005
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5006
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5007
  LDI r1, 0
  STORE r12, r1
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r1, 5
  LDI r12, 0x5502
  STORE r12, r1
  LDI r1, 10920
  LDI r12, 0x5503
  STORE r12, r1
  LDI r1, 0x00AAFF
  LDI r12, 0x5504
  STORE r12, r1
  LDI r1, 3
  LDI r12, 0x5501
  STORE r12, r1
  RET

store_koch_f:
  LDI r12, 0x5100
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5101
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5102
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5103
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5104
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5105
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5106
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5107
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5108
  LDI r1, 0
  STORE r12, r1
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r1, 2
  LDI r12, 0x5500
  STORE r12, r1
  ; axiom: F-G-G
  LDI r12, 0x5000
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5001
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5002
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5003
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5004
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5005
  LDI r1, 0
  STORE r12, r1
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r12, 0x5100
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5101
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5102
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5103
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5104
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5105
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5106
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5107
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5108
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5109
  LDI r1, 0
  STORE r12, r1
  ; rule G -> GG (at 0x5200)
  LDI r12, 0x5200
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5201
  LDI r1, 71
  STORE r12, r1
  LDI r12, 0x5202
  LDI r1, 0
  STORE r12, r1
  ; params
  LDI r1, 5
  LDI r12, 0x5502
  STORE r12, r1
  LDI r1, 21840
  LDI r12, 0x5503
  STORE r12, r1
  LDI r1, 0xFF6644
  LDI r12, 0x5504
  STORE r12, r1
  LDI r1, 5
  LDI r12, 0x5501
  STORE r12, r1
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r1, 3
  LDI r12, 0x5500
  STORE r12, r1
  ; axiom: FX
  LDI r12, 0x5000
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5001
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5002
  LDI r1, 0
  STORE r12, r1
  ; rule X -> X+YF+ (at 0x5300)
  LDI r12, 0x5300
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5301
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5302
  LDI r1, 89
  STORE r12, r1
  LDI r12, 0x5303
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5304
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5305
  LDI r1, 0
  STORE r12, r1
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r12, 0x5400
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5401
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5402
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5403
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5404
  LDI r1, 89
  STORE r12, r1
  LDI r12, 0x5405
  LDI r1, 0
  STORE r12, r1
  ; params
  LDI r1, 4
  LDI r12, 0x5502
  STORE r12, r1
  LDI r1, 16380
  LDI r12, 0x5503
  STORE r12, r1
  LDI r1, 0xFF2244
  LDI r12, 0x5504
  STORE r12, r1
  LDI r1, 8
  LDI r12, 0x5501
  STORE r12, r1
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r1, 4
  LDI r12, 0x5500
  STORE r12, r1
  ; axiom: X
  LDI r12, 0x5000
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5001
  LDI r1, 0
  STORE r12, r1
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r12, 0x5300
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5301
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5302
  LDI r1, 91
  STORE r12, r1
  LDI r12, 0x5303
  LDI r1, 91
  STORE r12, r1
  LDI r12, 0x5304
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5305
  LDI r1, 93
  STORE r12, r1
  LDI r12, 0x5306
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5307
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5308
  LDI r1, 93
  STORE r12, r1
  LDI r12, 0x5309
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x530A
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x530B
  LDI r1, 91
  STORE r12, r1
  LDI r12, 0x530C
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x530D
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x530E
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x530F
  LDI r1, 93
  STORE r12, r1
  LDI r12, 0x5310
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5311
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5312
  LDI r1, 0
  STORE r12, r1
  ; rule F -> FF (at 0x5100)
  LDI r12, 0x5100
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5101
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5102
  LDI r1, 0
  STORE r12, r1
  ; params
  LDI r1, 3
  LDI r12, 0x5502
  STORE r12, r1
  LDI r1, 4550
  LDI r12, 0x5503
  STORE r12, r1
  LDI r1, 0x22CC44
  LDI r12, 0x5504
  STORE r12, r1
  LDI r1, 4
  LDI r12, 0x5501
  STORE r12, r1
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r1, 5
  LDI r12, 0x5500
  STORE r12, r1
  ; axiom: X
  LDI r12, 0x5000
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5001
  LDI r1, 0
  STORE r12, r1
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r12, 0x5300
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5301
  LDI r1, 91
  STORE r12, r1
  LDI r12, 0x5302
  LDI r1, 43
  STORE r12, r1
  LDI r12, 0x5303
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5304
  LDI r1, 93
  STORE r12, r1
  LDI r12, 0x5305
  LDI r1, 91
  STORE r12, r1
  LDI r12, 0x5306
  LDI r1, 45
  STORE r12, r1
  LDI r12, 0x5307
  LDI r1, 88
  STORE r12, r1
  LDI r12, 0x5308
  LDI r1, 93
  STORE r12, r1
  LDI r12, 0x5309
  LDI r1, 0
  STORE r12, r1
  ; rule F -> FF (at 0x5100)
  LDI r12, 0x5100
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5101
  LDI r1, 70
  STORE r12, r1
  LDI r12, 0x5102
  LDI r1, 0
  STORE r12, r1
  ; params
  LDI r1, 4
  LDI r12, 0x5502
  STORE r12, r1
  LDI r1, 5460
  LDI r12, 0x5503
  STORE r12, r1
  LDI r1, 0x44AA22
  LDI r12, 0x5504
  STORE r12, r1
  LDI r1, 5
  LDI r12, 0x5501
  STORE r12, r1
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r13, 0x5000
  LDI r0, 0x2000
copy_axiom_lp:
  LDI r5, 0
  ADD r5, r13
  LOAD r4, r5
  JZ r4, axiom_copied
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4
  LDI r4, 1
  ADD r13, r4
  ADD r0, r4
  JMP copy_axiom_lp
axiom_copied:
  LDI r4, 0
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4

  ; get iteration count
  LDI r3, 0
  LDI r9, 0x5501
  LOAD r9, r9

expand_iter_lp:
  CMP r3, r9
  BGE r11, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r13, 0x2000
  LDI r0, 0x3000
exp_char_lp:
  LDI r5, 0
  ADD r5, r13
  LOAD r4, r5
  JZ r4, exp_copy_back

  ; check F
  LDI r5, 70
  CMP r4, r5
  JZ r11, exp_f
  ; check G
  LDI r5, 71
  CMP r4, r5
  JZ r11, exp_g
  ; check X
  LDI r5, 88
  CMP r4, r5
  JZ r11, exp_x
  ; check Y
  LDI r5, 89
  CMP r4, r5
  JZ r11, exp_y

  ; no rule -- copy char directly
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4
  LDI r4, 1
  ADD r0, r4
  LDI r4, 1
  ADD r13, r4
  JMP exp_char_lp

exp_f:
  LDI r4, 1
  ADD r13, r4
  LDI r4, 0x5100
  LDI r5, 0x5505
  STORE r5, r4
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r4, 1
  ADD r13, r4
  LDI r4, 0x5200
  LDI r5, 0x5505
  STORE r5, r4
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r4, 1
  ADD r13, r4
  LDI r4, 0x5300
  LDI r5, 0x5505
  STORE r5, r4
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r4, 1
  ADD r13, r4
  LDI r4, 0x5400
  LDI r5, 0x5505
  STORE r5, r4
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r4, 0
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4
  ; overflow check
  LDI r5, 0x3FFF
  CMP r0, r5
  BGE r11, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r13, 0x3000
  LDI r0, 0x2000
cp_back_lp:
  LDI r5, 0
  ADD r5, r13
  LOAD r4, r5
  JZ r4, cp_back_done
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4
  LDI r4, 1
  ADD r13, r4
  ADD r0, r4
  JMP cp_back_lp
cp_back_done:
  LDI r4, 0
  LDI r5, 0
  ADD r5, r0
  STORE r5, r4
  LDI r4, 1
  ADD r3, r4
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r0
; Advances r0 past copied chars
copy_rule:
  LDI r5, 0x5505
  LOAD r18, r5      ; r18 = rule base address
cp_rule_lp:
  LDI r5, 0
  ADD r5, r18
  LOAD r19, r5      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r5, 0
  ADD r5, r0
  STORE r5, r19
  LDI r19, 1
  ADD r0, r19
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
  LDI r13, 128
  LDI r0, 128
  LDI r5, 0

  ; load params
  LDI r12, 0x5504
  LOAD r3, r12       ; color
  LDI r12, 0x5503
  LOAD r9, r12       ; angle increment
  LDI r12, 0x5502
  LOAD r16, r12       ; line length

  ; position adjustments per preset
  LDI r12, 0x5500
  LOAD r17, r12
  LDI r18, 1
  CMP r17, r18
  JZ r11, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r11, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r11, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r11, pos_fern
  ; preset 5 tree
  LDI r0, 240
  LDI r5, 54600
  JMP pos_done

pos_koch:
  LDI r13, 20
  LDI r0, 180
  LDI r5, 54600
  JMP pos_done
pos_sierp:
  LDI r13, 30
  LDI r0, 200
  LDI r5, 0
  JMP pos_done
pos_drag:
  LDI r13, 128
  LDI r0, 128
  LDI r5, 0
  JMP pos_done
pos_fern:
  LDI r13, 128
  LDI r0, 240
  LDI r5, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r12, 0
  ADD r12, r20
  LOAD r7, r12
  JZ r7, turtle_done

  ; F = forward + draw
  LDI r12, 70
  CMP r7, r12
  JZ r11, t_fwd
  ; G = forward no draw
  LDI r12, 71
  CMP r7, r12
  JZ r11, t_move
  ; + = turn left
  LDI r12, 43
  CMP r7, r12
  JZ r11, t_left
  ; - = turn right
  LDI r12, 45
  CMP r7, r12
  JZ r11, t_right
  ; [ = push
  LDI r12, 91
  CMP r7, r12
  JZ r11, t_push
  ; ] = pop
  LDI r12, 93
  CMP r7, r12
  JZ r11, t_pop

  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r13, r0, r21, r22, r3
  MOV r13, r21
  MOV r0, r22
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r13, r21
  MOV r0, r22
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_left:
  ADD r5, r9
  LDI r12, 65536
  CMP r5, r12
  BLT r11, t_left_done
  SUB r5, r12
t_left_done:
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_right:
  SUB r5, r9
  ; If angle underflowed (bit 31 set), add 65536
  LDI r12, 31
  MOV r23, r5
  SHR r23, r12       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r12, 65536
  ADD r5, r12
t_right_done:
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_push:
  PUSH r13
  PUSH r0
  PUSH r5
  PUSH r31
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_pop:
  POP r31
  POP r5
  POP r0
  POP r13
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r13=x, r0=y, r5=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r5
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
  ADD r21, r13

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r0

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r12, 0x5504
  LOAD r7, r12
  LDI r1, 0
  LDI r12, 0
  LDI r14, 256
  LDI r8, 6
  RECTF r1, r12, r14, r8, r7
  ; iteration dots
  LDI r12, 0x5501
  LOAD r13, r12
  LDI r1, 0
  LDI r12, 12
  LDI r14, 10
info_lp:
  CMP r1, r13
  BGE r11, info_done
  PSET r1, r12, r7
  ADD r1, r14
  JMP info_lp
info_done:
  POP r31
  RET
