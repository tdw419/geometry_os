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
  IKEY r4
  JZ r4, main_loop

  ; key 1
  LDI r11, 49
  CMP r4, r11
  JZ r6, key_1
  ; key 2
  LDI r11, 50
  CMP r4, r11
  JZ r6, key_2
  ; key 3
  LDI r11, 51
  CMP r4, r11
  JZ r6, key_3
  ; key 4
  LDI r11, 52
  CMP r4, r11
  JZ r6, key_4
  ; key 5
  LDI r11, 53
  CMP r4, r11
  JZ r6, key_5
  ; + or =
  LDI r11, 43
  CMP r4, r11
  JZ r6, key_plus
  LDI r11, 61
  CMP r4, r11
  JZ r6, key_plus
  ; - or _
  LDI r11, 45
  CMP r4, r11
  JZ r6, key_minus
  LDI r11, 95
  CMP r4, r11
  JZ r6, key_minus

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
  LDI r10, 0x5501
  LOAD r0, r10
  LDI r7, 8
  CMP r0, r7
  BGE r6, main_loop
  LDI r7, 1
  ADD r0, r7
  STORE r10, r0
  JMP key_regen
key_minus:
  LDI r10, 0x5501
  LOAD r0, r10
  LDI r7, 1
  CMP r0, r7
  BLT r6, main_loop
  LDI r7, 1
  SUB r0, r7
  STORE r10, r0
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
  LDI r10, 0x7000
  LDI r5, 256
  STORE r10, r5
  LDI r10, 0x7001
  LDI r5, 181
  STORE r10, r5
  LDI r10, 0x7002
  LDI r5, 0
  STORE r10, r5
  LDI r10, 0x7003
  LDI r5, 0xFFFF73
  STORE r10, r5
  LDI r10, 0x7004
  LDI r5, 0xFFFFFF00
  STORE r10, r5
  LDI r10, 0x7005
  LDI r5, 0xFFFF73
  STORE r10, r5
  LDI r10, 0x7006
  LDI r5, 0
  STORE r10, r5
  LDI r10, 0x7007
  LDI r5, 181
  STORE r10, r5
  ; sin_table at 0x7010
  LDI r10, 0x7010
  LDI r5, 0
  STORE r10, r5
  LDI r10, 0x7011
  LDI r5, 181
  STORE r10, r5
  LDI r10, 0x7012
  LDI r5, 256
  STORE r10, r5
  LDI r10, 0x7013
  LDI r5, 181
  STORE r10, r5
  LDI r10, 0x7014
  LDI r5, 0
  STORE r10, r5
  LDI r10, 0x7015
  LDI r5, 0xFFFF73
  STORE r10, r5
  LDI r10, 0x7016
  LDI r5, 0xFFFFFF00
  STORE r10, r5
  LDI r10, 0x7017
  LDI r5, 0xFFFF73
  STORE r10, r5
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r5, 1
  LDI r10, 0x5500
  STORE r10, r5
  ; axiom: F--F--F (at 0x5000)
  LDI r10, 0x5000
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5001
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5002
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5003
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5004
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5005
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5006
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5007
  LDI r5, 0
  STORE r10, r5
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r5, 5
  LDI r10, 0x5502
  STORE r10, r5
  LDI r5, 10920
  LDI r10, 0x5503
  STORE r10, r5
  LDI r5, 0x00AAFF
  LDI r10, 0x5504
  STORE r10, r5
  LDI r5, 3
  LDI r10, 0x5501
  STORE r10, r5
  RET

store_koch_f:
  LDI r10, 0x5100
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5101
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5102
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5103
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5104
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5105
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5106
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5107
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5108
  LDI r5, 0
  STORE r10, r5
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r5, 2
  LDI r10, 0x5500
  STORE r10, r5
  ; axiom: F-G-G
  LDI r10, 0x5000
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5001
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5002
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5003
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5004
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5005
  LDI r5, 0
  STORE r10, r5
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r10, 0x5100
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5101
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5102
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5103
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5104
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5105
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5106
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5107
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5108
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5109
  LDI r5, 0
  STORE r10, r5
  ; rule G -> GG (at 0x5200)
  LDI r10, 0x5200
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5201
  LDI r5, 71
  STORE r10, r5
  LDI r10, 0x5202
  LDI r5, 0
  STORE r10, r5
  ; params
  LDI r5, 5
  LDI r10, 0x5502
  STORE r10, r5
  LDI r5, 21840
  LDI r10, 0x5503
  STORE r10, r5
  LDI r5, 0xFF6644
  LDI r10, 0x5504
  STORE r10, r5
  LDI r5, 5
  LDI r10, 0x5501
  STORE r10, r5
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r5, 3
  LDI r10, 0x5500
  STORE r10, r5
  ; axiom: FX
  LDI r10, 0x5000
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5001
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5002
  LDI r5, 0
  STORE r10, r5
  ; rule X -> X+YF+ (at 0x5300)
  LDI r10, 0x5300
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5301
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5302
  LDI r5, 89
  STORE r10, r5
  LDI r10, 0x5303
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5304
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5305
  LDI r5, 0
  STORE r10, r5
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r10, 0x5400
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5401
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5402
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5403
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5404
  LDI r5, 89
  STORE r10, r5
  LDI r10, 0x5405
  LDI r5, 0
  STORE r10, r5
  ; params
  LDI r5, 4
  LDI r10, 0x5502
  STORE r10, r5
  LDI r5, 16380
  LDI r10, 0x5503
  STORE r10, r5
  LDI r5, 0xFF2244
  LDI r10, 0x5504
  STORE r10, r5
  LDI r5, 8
  LDI r10, 0x5501
  STORE r10, r5
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r5, 4
  LDI r10, 0x5500
  STORE r10, r5
  ; axiom: X
  LDI r10, 0x5000
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5001
  LDI r5, 0
  STORE r10, r5
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r10, 0x5300
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5301
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5302
  LDI r5, 91
  STORE r10, r5
  LDI r10, 0x5303
  LDI r5, 91
  STORE r10, r5
  LDI r10, 0x5304
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5305
  LDI r5, 93
  STORE r10, r5
  LDI r10, 0x5306
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5307
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5308
  LDI r5, 93
  STORE r10, r5
  LDI r10, 0x5309
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x530A
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x530B
  LDI r5, 91
  STORE r10, r5
  LDI r10, 0x530C
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x530D
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x530E
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x530F
  LDI r5, 93
  STORE r10, r5
  LDI r10, 0x5310
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5311
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5312
  LDI r5, 0
  STORE r10, r5
  ; rule F -> FF (at 0x5100)
  LDI r10, 0x5100
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5101
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5102
  LDI r5, 0
  STORE r10, r5
  ; params
  LDI r5, 3
  LDI r10, 0x5502
  STORE r10, r5
  LDI r5, 4550
  LDI r10, 0x5503
  STORE r10, r5
  LDI r5, 0x22CC44
  LDI r10, 0x5504
  STORE r10, r5
  LDI r5, 4
  LDI r10, 0x5501
  STORE r10, r5
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r5, 5
  LDI r10, 0x5500
  STORE r10, r5
  ; axiom: X
  LDI r10, 0x5000
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5001
  LDI r5, 0
  STORE r10, r5
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r10, 0x5300
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5301
  LDI r5, 91
  STORE r10, r5
  LDI r10, 0x5302
  LDI r5, 43
  STORE r10, r5
  LDI r10, 0x5303
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5304
  LDI r5, 93
  STORE r10, r5
  LDI r10, 0x5305
  LDI r5, 91
  STORE r10, r5
  LDI r10, 0x5306
  LDI r5, 45
  STORE r10, r5
  LDI r10, 0x5307
  LDI r5, 88
  STORE r10, r5
  LDI r10, 0x5308
  LDI r5, 93
  STORE r10, r5
  LDI r10, 0x5309
  LDI r5, 0
  STORE r10, r5
  ; rule F -> FF (at 0x5100)
  LDI r10, 0x5100
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5101
  LDI r5, 70
  STORE r10, r5
  LDI r10, 0x5102
  LDI r5, 0
  STORE r10, r5
  ; params
  LDI r5, 4
  LDI r10, 0x5502
  STORE r10, r5
  LDI r5, 5460
  LDI r10, 0x5503
  STORE r10, r5
  LDI r5, 0x44AA22
  LDI r10, 0x5504
  STORE r10, r5
  LDI r5, 5
  LDI r10, 0x5501
  STORE r10, r5
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r4, 0x5000
  LDI r11, 0x2000
copy_axiom_lp:
  LDI r3, 0
  ADD r3, r4
  LOAD r9, r3
  JZ r9, axiom_copied
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9
  LDI r9, 1
  ADD r4, r9
  ADD r11, r9
  JMP copy_axiom_lp
axiom_copied:
  LDI r9, 0
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9

  ; get iteration count
  LDI r1, 0
  LDI r12, 0x5501
  LOAD r12, r12

expand_iter_lp:
  CMP r1, r12
  BGE r6, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r4, 0x2000
  LDI r11, 0x3000
exp_char_lp:
  LDI r3, 0
  ADD r3, r4
  LOAD r9, r3
  JZ r9, exp_copy_back

  ; check F
  LDI r3, 70
  CMP r9, r3
  JZ r6, exp_f
  ; check G
  LDI r3, 71
  CMP r9, r3
  JZ r6, exp_g
  ; check X
  LDI r3, 88
  CMP r9, r3
  JZ r6, exp_x
  ; check Y
  LDI r3, 89
  CMP r9, r3
  JZ r6, exp_y

  ; no rule -- copy char directly
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9
  LDI r9, 1
  ADD r11, r9
  LDI r9, 1
  ADD r4, r9
  JMP exp_char_lp

exp_f:
  LDI r9, 1
  ADD r4, r9
  LDI r9, 0x5100
  LDI r3, 0x5505
  STORE r3, r9
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r9, 1
  ADD r4, r9
  LDI r9, 0x5200
  LDI r3, 0x5505
  STORE r3, r9
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r9, 1
  ADD r4, r9
  LDI r9, 0x5300
  LDI r3, 0x5505
  STORE r3, r9
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r9, 1
  ADD r4, r9
  LDI r9, 0x5400
  LDI r3, 0x5505
  STORE r3, r9
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r9, 0
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9
  ; overflow check
  LDI r3, 0x3FFF
  CMP r11, r3
  BGE r6, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r4, 0x3000
  LDI r11, 0x2000
cp_back_lp:
  LDI r3, 0
  ADD r3, r4
  LOAD r9, r3
  JZ r9, cp_back_done
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9
  LDI r9, 1
  ADD r4, r9
  ADD r11, r9
  JMP cp_back_lp
cp_back_done:
  LDI r9, 0
  LDI r3, 0
  ADD r3, r11
  STORE r3, r9
  LDI r9, 1
  ADD r1, r9
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r11
; Advances r11 past copied chars
copy_rule:
  LDI r3, 0x5505
  LOAD r18, r3      ; r18 = rule base address
cp_rule_lp:
  LDI r3, 0
  ADD r3, r18
  LOAD r19, r3      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r3, 0
  ADD r3, r11
  STORE r3, r19
  LDI r19, 1
  ADD r11, r19
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
  LDI r11, 128
  LDI r3, 0

  ; load params
  LDI r10, 0x5504
  LOAD r1, r10       ; color
  LDI r10, 0x5503
  LOAD r12, r10       ; angle increment
  LDI r10, 0x5502
  LOAD r16, r10       ; line length

  ; position adjustments per preset
  LDI r10, 0x5500
  LOAD r17, r10
  LDI r18, 1
  CMP r17, r18
  JZ r6, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r6, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r6, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r6, pos_fern
  ; preset 5 tree
  LDI r11, 240
  LDI r3, 54600
  JMP pos_done

pos_koch:
  LDI r4, 20
  LDI r11, 180
  LDI r3, 54600
  JMP pos_done
pos_sierp:
  LDI r4, 30
  LDI r11, 200
  LDI r3, 0
  JMP pos_done
pos_drag:
  LDI r4, 128
  LDI r11, 128
  LDI r3, 0
  JMP pos_done
pos_fern:
  LDI r4, 128
  LDI r11, 240
  LDI r3, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r10, 0
  ADD r10, r20
  LOAD r0, r10
  JZ r0, turtle_done

  ; F = forward + draw
  LDI r10, 70
  CMP r0, r10
  JZ r6, t_fwd
  ; G = forward no draw
  LDI r10, 71
  CMP r0, r10
  JZ r6, t_move
  ; + = turn left
  LDI r10, 43
  CMP r0, r10
  JZ r6, t_left
  ; - = turn right
  LDI r10, 45
  CMP r0, r10
  JZ r6, t_right
  ; [ = push
  LDI r10, 91
  CMP r0, r10
  JZ r6, t_push
  ; ] = pop
  LDI r10, 93
  CMP r0, r10
  JZ r6, t_pop

  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r4, r11, r21, r22, r1
  MOV r4, r21
  MOV r11, r22
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r4, r21
  MOV r11, r22
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_left:
  ADD r3, r12
  LDI r10, 65536
  CMP r3, r10
  BLT r6, t_left_done
  SUB r3, r10
t_left_done:
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_right:
  SUB r3, r12
  ; If angle underflowed (bit 31 set), add 65536
  LDI r10, 31
  MOV r23, r3
  SHR r23, r10       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r10, 65536
  ADD r3, r10
t_right_done:
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_push:
  PUSH r4
  PUSH r11
  PUSH r3
  PUSH r31
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

t_pop:
  POP r31
  POP r3
  POP r11
  POP r4
  LDI r10, 1
  ADD r20, r10
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r4=x, r11=y, r3=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r3
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
  SUB r22, r11

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r10, 0x5504
  LOAD r0, r10
  LDI r5, 0
  LDI r10, 0
  LDI r7, 256
  LDI r13, 6
  RECTF r5, r10, r7, r13, r0
  ; iteration dots
  LDI r10, 0x5501
  LOAD r4, r10
  LDI r5, 0
  LDI r10, 12
  LDI r7, 10
info_lp:
  CMP r5, r4
  BGE r6, info_done
  PSET r5, r10, r0
  ADD r5, r7
  JMP info_lp
info_done:
  POP r31
  RET
