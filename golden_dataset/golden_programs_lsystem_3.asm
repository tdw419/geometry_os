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
  LDI r13, 49
  CMP r4, r13
  JZ r12, key_1
  ; key 2
  LDI r13, 50
  CMP r4, r13
  JZ r12, key_2
  ; key 3
  LDI r13, 51
  CMP r4, r13
  JZ r12, key_3
  ; key 4
  LDI r13, 52
  CMP r4, r13
  JZ r12, key_4
  ; key 5
  LDI r13, 53
  CMP r4, r13
  JZ r12, key_5
  ; + or =
  LDI r13, 43
  CMP r4, r13
  JZ r12, key_plus
  LDI r13, 61
  CMP r4, r13
  JZ r12, key_plus
  ; - or _
  LDI r13, 45
  CMP r4, r13
  JZ r12, key_minus
  LDI r13, 95
  CMP r4, r13
  JZ r12, key_minus

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
  LDI r5, 0x5501
  LOAD r3, r5
  LDI r7, 8
  CMP r3, r7
  BGE r12, main_loop
  LDI r7, 1
  ADD r3, r7
  STORE r5, r3
  JMP key_regen
key_minus:
  LDI r5, 0x5501
  LOAD r3, r5
  LDI r7, 1
  CMP r3, r7
  BLT r12, main_loop
  LDI r7, 1
  SUB r3, r7
  STORE r5, r3
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
  LDI r5, 0x7000
  LDI r9, 256
  STORE r5, r9
  LDI r5, 0x7001
  LDI r9, 181
  STORE r5, r9
  LDI r5, 0x7002
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x7003
  LDI r9, 0xFFFF73
  STORE r5, r9
  LDI r5, 0x7004
  LDI r9, 0xFFFFFF00
  STORE r5, r9
  LDI r5, 0x7005
  LDI r9, 0xFFFF73
  STORE r5, r9
  LDI r5, 0x7006
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x7007
  LDI r9, 181
  STORE r5, r9
  ; sin_table at 0x7010
  LDI r5, 0x7010
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x7011
  LDI r9, 181
  STORE r5, r9
  LDI r5, 0x7012
  LDI r9, 256
  STORE r5, r9
  LDI r5, 0x7013
  LDI r9, 181
  STORE r5, r9
  LDI r5, 0x7014
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x7015
  LDI r9, 0xFFFF73
  STORE r5, r9
  LDI r5, 0x7016
  LDI r9, 0xFFFFFF00
  STORE r5, r9
  LDI r5, 0x7017
  LDI r9, 0xFFFF73
  STORE r5, r9
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r9, 1
  LDI r5, 0x5500
  STORE r5, r9
  ; axiom: F--F--F (at 0x5000)
  LDI r5, 0x5000
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5001
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5002
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5003
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5004
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5005
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5006
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5007
  LDI r9, 0
  STORE r5, r9
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r9, 5
  LDI r5, 0x5502
  STORE r5, r9
  LDI r9, 10920
  LDI r5, 0x5503
  STORE r5, r9
  LDI r9, 0x00AAFF
  LDI r5, 0x5504
  STORE r5, r9
  LDI r9, 3
  LDI r5, 0x5501
  STORE r5, r9
  RET

store_koch_f:
  LDI r5, 0x5100
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5101
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5102
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5103
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5104
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5105
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5106
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5107
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5108
  LDI r9, 0
  STORE r5, r9
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r9, 2
  LDI r5, 0x5500
  STORE r5, r9
  ; axiom: F-G-G
  LDI r5, 0x5000
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5001
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5002
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5003
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5004
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5005
  LDI r9, 0
  STORE r5, r9
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r5, 0x5100
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5101
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5102
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5103
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5104
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5105
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5106
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5107
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5108
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5109
  LDI r9, 0
  STORE r5, r9
  ; rule G -> GG (at 0x5200)
  LDI r5, 0x5200
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5201
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x5202
  LDI r9, 0
  STORE r5, r9
  ; params
  LDI r9, 5
  LDI r5, 0x5502
  STORE r5, r9
  LDI r9, 21840
  LDI r5, 0x5503
  STORE r5, r9
  LDI r9, 0xFF6644
  LDI r5, 0x5504
  STORE r5, r9
  LDI r9, 5
  LDI r5, 0x5501
  STORE r5, r9
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r9, 3
  LDI r5, 0x5500
  STORE r5, r9
  ; axiom: FX
  LDI r5, 0x5000
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5001
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5002
  LDI r9, 0
  STORE r5, r9
  ; rule X -> X+YF+ (at 0x5300)
  LDI r5, 0x5300
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5301
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5302
  LDI r9, 89
  STORE r5, r9
  LDI r5, 0x5303
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5304
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5305
  LDI r9, 0
  STORE r5, r9
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r5, 0x5400
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5401
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5402
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5403
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5404
  LDI r9, 89
  STORE r5, r9
  LDI r5, 0x5405
  LDI r9, 0
  STORE r5, r9
  ; params
  LDI r9, 4
  LDI r5, 0x5502
  STORE r5, r9
  LDI r9, 16380
  LDI r5, 0x5503
  STORE r5, r9
  LDI r9, 0xFF2244
  LDI r5, 0x5504
  STORE r5, r9
  LDI r9, 8
  LDI r5, 0x5501
  STORE r5, r9
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r9, 4
  LDI r5, 0x5500
  STORE r5, r9
  ; axiom: X
  LDI r5, 0x5000
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5001
  LDI r9, 0
  STORE r5, r9
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r5, 0x5300
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5301
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5302
  LDI r9, 91
  STORE r5, r9
  LDI r5, 0x5303
  LDI r9, 91
  STORE r5, r9
  LDI r5, 0x5304
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5305
  LDI r9, 93
  STORE r5, r9
  LDI r5, 0x5306
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5307
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5308
  LDI r9, 93
  STORE r5, r9
  LDI r5, 0x5309
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x530A
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x530B
  LDI r9, 91
  STORE r5, r9
  LDI r5, 0x530C
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x530D
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x530E
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x530F
  LDI r9, 93
  STORE r5, r9
  LDI r5, 0x5310
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5311
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5312
  LDI r9, 0
  STORE r5, r9
  ; rule F -> FF (at 0x5100)
  LDI r5, 0x5100
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5101
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5102
  LDI r9, 0
  STORE r5, r9
  ; params
  LDI r9, 3
  LDI r5, 0x5502
  STORE r5, r9
  LDI r9, 4550
  LDI r5, 0x5503
  STORE r5, r9
  LDI r9, 0x22CC44
  LDI r5, 0x5504
  STORE r5, r9
  LDI r9, 4
  LDI r5, 0x5501
  STORE r5, r9
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r9, 5
  LDI r5, 0x5500
  STORE r5, r9
  ; axiom: X
  LDI r5, 0x5000
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5001
  LDI r9, 0
  STORE r5, r9
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r5, 0x5300
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5301
  LDI r9, 91
  STORE r5, r9
  LDI r5, 0x5302
  LDI r9, 43
  STORE r5, r9
  LDI r5, 0x5303
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5304
  LDI r9, 93
  STORE r5, r9
  LDI r5, 0x5305
  LDI r9, 91
  STORE r5, r9
  LDI r5, 0x5306
  LDI r9, 45
  STORE r5, r9
  LDI r5, 0x5307
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x5308
  LDI r9, 93
  STORE r5, r9
  LDI r5, 0x5309
  LDI r9, 0
  STORE r5, r9
  ; rule F -> FF (at 0x5100)
  LDI r5, 0x5100
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5101
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x5102
  LDI r9, 0
  STORE r5, r9
  ; params
  LDI r9, 4
  LDI r5, 0x5502
  STORE r5, r9
  LDI r9, 5460
  LDI r5, 0x5503
  STORE r5, r9
  LDI r9, 0x44AA22
  LDI r5, 0x5504
  STORE r5, r9
  LDI r9, 5
  LDI r5, 0x5501
  STORE r5, r9
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r4, 0x5000
  LDI r13, 0x2000
copy_axiom_lp:
  LDI r2, 0
  ADD r2, r4
  LOAD r0, r2
  JZ r0, axiom_copied
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0
  LDI r0, 1
  ADD r4, r0
  ADD r13, r0
  JMP copy_axiom_lp
axiom_copied:
  LDI r0, 0
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0

  ; get iteration count
  LDI r10, 0
  LDI r14, 0x5501
  LOAD r14, r14

expand_iter_lp:
  CMP r10, r14
  BGE r12, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r4, 0x2000
  LDI r13, 0x3000
exp_char_lp:
  LDI r2, 0
  ADD r2, r4
  LOAD r0, r2
  JZ r0, exp_copy_back

  ; check F
  LDI r2, 70
  CMP r0, r2
  JZ r12, exp_f
  ; check G
  LDI r2, 71
  CMP r0, r2
  JZ r12, exp_g
  ; check X
  LDI r2, 88
  CMP r0, r2
  JZ r12, exp_x
  ; check Y
  LDI r2, 89
  CMP r0, r2
  JZ r12, exp_y

  ; no rule -- copy char directly
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0
  LDI r0, 1
  ADD r13, r0
  LDI r0, 1
  ADD r4, r0
  JMP exp_char_lp

exp_f:
  LDI r0, 1
  ADD r4, r0
  LDI r0, 0x5100
  LDI r2, 0x5505
  STORE r2, r0
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r0, 1
  ADD r4, r0
  LDI r0, 0x5200
  LDI r2, 0x5505
  STORE r2, r0
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r0, 1
  ADD r4, r0
  LDI r0, 0x5300
  LDI r2, 0x5505
  STORE r2, r0
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r0, 1
  ADD r4, r0
  LDI r0, 0x5400
  LDI r2, 0x5505
  STORE r2, r0
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r0, 0
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0
  ; overflow check
  LDI r2, 0x3FFF
  CMP r13, r2
  BGE r12, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r4, 0x3000
  LDI r13, 0x2000
cp_back_lp:
  LDI r2, 0
  ADD r2, r4
  LOAD r0, r2
  JZ r0, cp_back_done
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0
  LDI r0, 1
  ADD r4, r0
  ADD r13, r0
  JMP cp_back_lp
cp_back_done:
  LDI r0, 0
  LDI r2, 0
  ADD r2, r13
  STORE r2, r0
  LDI r0, 1
  ADD r10, r0
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r13
; Advances r13 past copied chars
copy_rule:
  LDI r2, 0x5505
  LOAD r18, r2      ; r18 = rule base address
cp_rule_lp:
  LDI r2, 0
  ADD r2, r18
  LOAD r19, r2      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r2, 0
  ADD r2, r13
  STORE r2, r19
  LDI r19, 1
  ADD r13, r19
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
  LDI r13, 128
  LDI r2, 0

  ; load params
  LDI r5, 0x5504
  LOAD r10, r5       ; color
  LDI r5, 0x5503
  LOAD r14, r5       ; angle increment
  LDI r5, 0x5502
  LOAD r16, r5       ; line length

  ; position adjustments per preset
  LDI r5, 0x5500
  LOAD r17, r5
  LDI r18, 1
  CMP r17, r18
  JZ r12, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r12, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r12, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r12, pos_fern
  ; preset 5 tree
  LDI r13, 240
  LDI r2, 54600
  JMP pos_done

pos_koch:
  LDI r4, 20
  LDI r13, 180
  LDI r2, 54600
  JMP pos_done
pos_sierp:
  LDI r4, 30
  LDI r13, 200
  LDI r2, 0
  JMP pos_done
pos_drag:
  LDI r4, 128
  LDI r13, 128
  LDI r2, 0
  JMP pos_done
pos_fern:
  LDI r4, 128
  LDI r13, 240
  LDI r2, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r5, 0
  ADD r5, r20
  LOAD r3, r5
  JZ r3, turtle_done

  ; F = forward + draw
  LDI r5, 70
  CMP r3, r5
  JZ r12, t_fwd
  ; G = forward no draw
  LDI r5, 71
  CMP r3, r5
  JZ r12, t_move
  ; + = turn left
  LDI r5, 43
  CMP r3, r5
  JZ r12, t_left
  ; - = turn right
  LDI r5, 45
  CMP r3, r5
  JZ r12, t_right
  ; [ = push
  LDI r5, 91
  CMP r3, r5
  JZ r12, t_push
  ; ] = pop
  LDI r5, 93
  CMP r3, r5
  JZ r12, t_pop

  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r4, r13, r21, r22, r10
  MOV r4, r21
  MOV r13, r22
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r4, r21
  MOV r13, r22
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_left:
  ADD r2, r14
  LDI r5, 65536
  CMP r2, r5
  BLT r12, t_left_done
  SUB r2, r5
t_left_done:
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_right:
  SUB r2, r14
  ; If angle underflowed (bit 31 set), add 65536
  LDI r5, 31
  MOV r23, r2
  SHR r23, r5       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r5, 65536
  ADD r2, r5
t_right_done:
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_push:
  PUSH r4
  PUSH r13
  PUSH r2
  PUSH r31
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

t_pop:
  POP r31
  POP r2
  POP r13
  POP r4
  LDI r5, 1
  ADD r20, r5
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r4=x, r13=y, r2=angle(0-65535), r16=line_length
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
  ADD r21, r4

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r13

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r5, 0x5504
  LOAD r3, r5
  LDI r9, 0
  LDI r5, 0
  LDI r7, 256
  LDI r1, 6
  RECTF r9, r5, r7, r1, r3
  ; iteration dots
  LDI r5, 0x5501
  LOAD r4, r5
  LDI r9, 0
  LDI r5, 12
  LDI r7, 10
info_lp:
  CMP r9, r4
  BGE r12, info_done
  PSET r9, r5, r3
  ADD r9, r7
  JMP info_lp
info_done:
  POP r31
  RET
