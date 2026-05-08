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
  IKEY r8
  JZ r8, main_loop

  ; key 1
  LDI r12, 49
  CMP r8, r12
  JZ r1, key_1
  ; key 2
  LDI r12, 50
  CMP r8, r12
  JZ r1, key_2
  ; key 3
  LDI r12, 51
  CMP r8, r12
  JZ r1, key_3
  ; key 4
  LDI r12, 52
  CMP r8, r12
  JZ r1, key_4
  ; key 5
  LDI r12, 53
  CMP r8, r12
  JZ r1, key_5
  ; + or =
  LDI r12, 43
  CMP r8, r12
  JZ r1, key_plus
  LDI r12, 61
  CMP r8, r12
  JZ r1, key_plus
  ; - or _
  LDI r12, 45
  CMP r8, r12
  JZ r1, key_minus
  LDI r12, 95
  CMP r8, r12
  JZ r1, key_minus

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
  LDI r6, 0x5501
  LOAD r14, r6
  LDI r4, 8
  CMP r14, r4
  BGE r1, main_loop
  LDI r4, 1
  ADD r14, r4
  STORE r6, r14
  JMP key_regen
key_minus:
  LDI r6, 0x5501
  LOAD r14, r6
  LDI r4, 1
  CMP r14, r4
  BLT r1, main_loop
  LDI r4, 1
  SUB r14, r4
  STORE r6, r14
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
  LDI r6, 0x7000
  LDI r7, 256
  STORE r6, r7
  LDI r6, 0x7001
  LDI r7, 181
  STORE r6, r7
  LDI r6, 0x7002
  LDI r7, 0
  STORE r6, r7
  LDI r6, 0x7003
  LDI r7, 0xFFFF73
  STORE r6, r7
  LDI r6, 0x7004
  LDI r7, 0xFFFFFF00
  STORE r6, r7
  LDI r6, 0x7005
  LDI r7, 0xFFFF73
  STORE r6, r7
  LDI r6, 0x7006
  LDI r7, 0
  STORE r6, r7
  LDI r6, 0x7007
  LDI r7, 181
  STORE r6, r7
  ; sin_table at 0x7010
  LDI r6, 0x7010
  LDI r7, 0
  STORE r6, r7
  LDI r6, 0x7011
  LDI r7, 181
  STORE r6, r7
  LDI r6, 0x7012
  LDI r7, 256
  STORE r6, r7
  LDI r6, 0x7013
  LDI r7, 181
  STORE r6, r7
  LDI r6, 0x7014
  LDI r7, 0
  STORE r6, r7
  LDI r6, 0x7015
  LDI r7, 0xFFFF73
  STORE r6, r7
  LDI r6, 0x7016
  LDI r7, 0xFFFFFF00
  STORE r6, r7
  LDI r6, 0x7017
  LDI r7, 0xFFFF73
  STORE r6, r7
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r7, 1
  LDI r6, 0x5500
  STORE r6, r7
  ; axiom: F--F--F (at 0x5000)
  LDI r6, 0x5000
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5001
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5002
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5003
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5004
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5005
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5006
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5007
  LDI r7, 0
  STORE r6, r7
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r7, 5
  LDI r6, 0x5502
  STORE r6, r7
  LDI r7, 10920
  LDI r6, 0x5503
  STORE r6, r7
  LDI r7, 0x00AAFF
  LDI r6, 0x5504
  STORE r6, r7
  LDI r7, 3
  LDI r6, 0x5501
  STORE r6, r7
  RET

store_koch_f:
  LDI r6, 0x5100
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5101
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5102
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5103
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5104
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5105
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5106
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5107
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5108
  LDI r7, 0
  STORE r6, r7
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r7, 2
  LDI r6, 0x5500
  STORE r6, r7
  ; axiom: F-G-G
  LDI r6, 0x5000
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5001
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5002
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5003
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5004
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5005
  LDI r7, 0
  STORE r6, r7
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r6, 0x5100
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5101
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5102
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5103
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5104
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5105
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5106
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5107
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5108
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5109
  LDI r7, 0
  STORE r6, r7
  ; rule G -> GG (at 0x5200)
  LDI r6, 0x5200
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5201
  LDI r7, 71
  STORE r6, r7
  LDI r6, 0x5202
  LDI r7, 0
  STORE r6, r7
  ; params
  LDI r7, 5
  LDI r6, 0x5502
  STORE r6, r7
  LDI r7, 21840
  LDI r6, 0x5503
  STORE r6, r7
  LDI r7, 0xFF6644
  LDI r6, 0x5504
  STORE r6, r7
  LDI r7, 5
  LDI r6, 0x5501
  STORE r6, r7
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r7, 3
  LDI r6, 0x5500
  STORE r6, r7
  ; axiom: FX
  LDI r6, 0x5000
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5001
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5002
  LDI r7, 0
  STORE r6, r7
  ; rule X -> X+YF+ (at 0x5300)
  LDI r6, 0x5300
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5301
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5302
  LDI r7, 89
  STORE r6, r7
  LDI r6, 0x5303
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5304
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5305
  LDI r7, 0
  STORE r6, r7
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r6, 0x5400
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5401
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5402
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5403
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5404
  LDI r7, 89
  STORE r6, r7
  LDI r6, 0x5405
  LDI r7, 0
  STORE r6, r7
  ; params
  LDI r7, 4
  LDI r6, 0x5502
  STORE r6, r7
  LDI r7, 16380
  LDI r6, 0x5503
  STORE r6, r7
  LDI r7, 0xFF2244
  LDI r6, 0x5504
  STORE r6, r7
  LDI r7, 8
  LDI r6, 0x5501
  STORE r6, r7
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r7, 4
  LDI r6, 0x5500
  STORE r6, r7
  ; axiom: X
  LDI r6, 0x5000
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5001
  LDI r7, 0
  STORE r6, r7
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r6, 0x5300
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5301
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5302
  LDI r7, 91
  STORE r6, r7
  LDI r6, 0x5303
  LDI r7, 91
  STORE r6, r7
  LDI r6, 0x5304
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5305
  LDI r7, 93
  STORE r6, r7
  LDI r6, 0x5306
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5307
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5308
  LDI r7, 93
  STORE r6, r7
  LDI r6, 0x5309
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x530A
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x530B
  LDI r7, 91
  STORE r6, r7
  LDI r6, 0x530C
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x530D
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x530E
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x530F
  LDI r7, 93
  STORE r6, r7
  LDI r6, 0x5310
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5311
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5312
  LDI r7, 0
  STORE r6, r7
  ; rule F -> FF (at 0x5100)
  LDI r6, 0x5100
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5101
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5102
  LDI r7, 0
  STORE r6, r7
  ; params
  LDI r7, 3
  LDI r6, 0x5502
  STORE r6, r7
  LDI r7, 4550
  LDI r6, 0x5503
  STORE r6, r7
  LDI r7, 0x22CC44
  LDI r6, 0x5504
  STORE r6, r7
  LDI r7, 4
  LDI r6, 0x5501
  STORE r6, r7
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r7, 5
  LDI r6, 0x5500
  STORE r6, r7
  ; axiom: X
  LDI r6, 0x5000
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5001
  LDI r7, 0
  STORE r6, r7
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r6, 0x5300
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5301
  LDI r7, 91
  STORE r6, r7
  LDI r6, 0x5302
  LDI r7, 43
  STORE r6, r7
  LDI r6, 0x5303
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5304
  LDI r7, 93
  STORE r6, r7
  LDI r6, 0x5305
  LDI r7, 91
  STORE r6, r7
  LDI r6, 0x5306
  LDI r7, 45
  STORE r6, r7
  LDI r6, 0x5307
  LDI r7, 88
  STORE r6, r7
  LDI r6, 0x5308
  LDI r7, 93
  STORE r6, r7
  LDI r6, 0x5309
  LDI r7, 0
  STORE r6, r7
  ; rule F -> FF (at 0x5100)
  LDI r6, 0x5100
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5101
  LDI r7, 70
  STORE r6, r7
  LDI r6, 0x5102
  LDI r7, 0
  STORE r6, r7
  ; params
  LDI r7, 4
  LDI r6, 0x5502
  STORE r6, r7
  LDI r7, 5460
  LDI r6, 0x5503
  STORE r6, r7
  LDI r7, 0x44AA22
  LDI r6, 0x5504
  STORE r6, r7
  LDI r7, 5
  LDI r6, 0x5501
  STORE r6, r7
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r8, 0x5000
  LDI r12, 0x2000
copy_axiom_lp:
  LDI r2, 0
  ADD r2, r8
  LOAD r15, r2
  JZ r15, axiom_copied
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15
  LDI r15, 1
  ADD r8, r15
  ADD r12, r15
  JMP copy_axiom_lp
axiom_copied:
  LDI r15, 0
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15

  ; get iteration count
  LDI r5, 0
  LDI r9, 0x5501
  LOAD r9, r9

expand_iter_lp:
  CMP r5, r9
  BGE r1, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r8, 0x2000
  LDI r12, 0x3000
exp_char_lp:
  LDI r2, 0
  ADD r2, r8
  LOAD r15, r2
  JZ r15, exp_copy_back

  ; check F
  LDI r2, 70
  CMP r15, r2
  JZ r1, exp_f
  ; check G
  LDI r2, 71
  CMP r15, r2
  JZ r1, exp_g
  ; check X
  LDI r2, 88
  CMP r15, r2
  JZ r1, exp_x
  ; check Y
  LDI r2, 89
  CMP r15, r2
  JZ r1, exp_y

  ; no rule -- copy char directly
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15
  LDI r15, 1
  ADD r12, r15
  LDI r15, 1
  ADD r8, r15
  JMP exp_char_lp

exp_f:
  LDI r15, 1
  ADD r8, r15
  LDI r15, 0x5100
  LDI r2, 0x5505
  STORE r2, r15
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r15, 1
  ADD r8, r15
  LDI r15, 0x5200
  LDI r2, 0x5505
  STORE r2, r15
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r15, 1
  ADD r8, r15
  LDI r15, 0x5300
  LDI r2, 0x5505
  STORE r2, r15
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r15, 1
  ADD r8, r15
  LDI r15, 0x5400
  LDI r2, 0x5505
  STORE r2, r15
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r15, 0
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15
  ; overflow check
  LDI r2, 0x3FFF
  CMP r12, r2
  BGE r1, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r8, 0x3000
  LDI r12, 0x2000
cp_back_lp:
  LDI r2, 0
  ADD r2, r8
  LOAD r15, r2
  JZ r15, cp_back_done
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15
  LDI r15, 1
  ADD r8, r15
  ADD r12, r15
  JMP cp_back_lp
cp_back_done:
  LDI r15, 0
  LDI r2, 0
  ADD r2, r12
  STORE r2, r15
  LDI r15, 1
  ADD r5, r15
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r12
; Advances r12 past copied chars
copy_rule:
  LDI r2, 0x5505
  LOAD r18, r2      ; r18 = rule base address
cp_rule_lp:
  LDI r2, 0
  ADD r2, r18
  LOAD r19, r2      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r2, 0
  ADD r2, r12
  STORE r2, r19
  LDI r19, 1
  ADD r12, r19
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
  LDI r8, 128
  LDI r12, 128
  LDI r2, 0

  ; load params
  LDI r6, 0x5504
  LOAD r5, r6       ; color
  LDI r6, 0x5503
  LOAD r9, r6       ; angle increment
  LDI r6, 0x5502
  LOAD r16, r6       ; line length

  ; position adjustments per preset
  LDI r6, 0x5500
  LOAD r17, r6
  LDI r18, 1
  CMP r17, r18
  JZ r1, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r1, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r1, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r1, pos_fern
  ; preset 5 tree
  LDI r12, 240
  LDI r2, 54600
  JMP pos_done

pos_koch:
  LDI r8, 20
  LDI r12, 180
  LDI r2, 54600
  JMP pos_done
pos_sierp:
  LDI r8, 30
  LDI r12, 200
  LDI r2, 0
  JMP pos_done
pos_drag:
  LDI r8, 128
  LDI r12, 128
  LDI r2, 0
  JMP pos_done
pos_fern:
  LDI r8, 128
  LDI r12, 240
  LDI r2, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r6, 0
  ADD r6, r20
  LOAD r14, r6
  JZ r14, turtle_done

  ; F = forward + draw
  LDI r6, 70
  CMP r14, r6
  JZ r1, t_fwd
  ; G = forward no draw
  LDI r6, 71
  CMP r14, r6
  JZ r1, t_move
  ; + = turn left
  LDI r6, 43
  CMP r14, r6
  JZ r1, t_left
  ; - = turn right
  LDI r6, 45
  CMP r14, r6
  JZ r1, t_right
  ; [ = push
  LDI r6, 91
  CMP r14, r6
  JZ r1, t_push
  ; ] = pop
  LDI r6, 93
  CMP r14, r6
  JZ r1, t_pop

  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r8, r12, r21, r22, r5
  MOV r8, r21
  MOV r12, r22
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r8, r21
  MOV r12, r22
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_left:
  ADD r2, r9
  LDI r6, 65536
  CMP r2, r6
  BLT r1, t_left_done
  SUB r2, r6
t_left_done:
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_right:
  SUB r2, r9
  ; If angle underflowed (bit 31 set), add 65536
  LDI r6, 31
  MOV r23, r2
  SHR r23, r6       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r6, 65536
  ADD r2, r6
t_right_done:
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_push:
  PUSH r8
  PUSH r12
  PUSH r2
  PUSH r31
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_pop:
  POP r31
  POP r2
  POP r12
  POP r8
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r8=x, r12=y, r2=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r2
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
  ADD r21, r8

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r12

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r6, 0x5504
  LOAD r14, r6
  LDI r7, 0
  LDI r6, 0
  LDI r4, 256
  LDI r3, 6
  RECTF r7, r6, r4, r3, r14
  ; iteration dots
  LDI r6, 0x5501
  LOAD r8, r6
  LDI r7, 0
  LDI r6, 12
  LDI r4, 10
info_lp:
  CMP r7, r8
  BGE r1, info_done
  PSET r7, r6, r14
  ADD r7, r4
  JMP info_lp
info_done:
  POP r31
  RET
