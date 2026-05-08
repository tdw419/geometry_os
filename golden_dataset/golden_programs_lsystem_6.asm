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
  IKEY r0
  JZ r0, main_loop

  ; key 1
  LDI r2, 49
  CMP r0, r2
  JZ r5, key_1
  ; key 2
  LDI r2, 50
  CMP r0, r2
  JZ r5, key_2
  ; key 3
  LDI r2, 51
  CMP r0, r2
  JZ r5, key_3
  ; key 4
  LDI r2, 52
  CMP r0, r2
  JZ r5, key_4
  ; key 5
  LDI r2, 53
  CMP r0, r2
  JZ r5, key_5
  ; + or =
  LDI r2, 43
  CMP r0, r2
  JZ r5, key_plus
  LDI r2, 61
  CMP r0, r2
  JZ r5, key_plus
  ; - or _
  LDI r2, 45
  CMP r0, r2
  JZ r5, key_minus
  LDI r2, 95
  CMP r0, r2
  JZ r5, key_minus

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
  LOAD r8, r6
  LDI r11, 8
  CMP r8, r11
  BGE r5, main_loop
  LDI r11, 1
  ADD r8, r11
  STORE r6, r8
  JMP key_regen
key_minus:
  LDI r6, 0x5501
  LOAD r8, r6
  LDI r11, 1
  CMP r8, r11
  BLT r5, main_loop
  LDI r11, 1
  SUB r8, r11
  STORE r6, r8
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
  LDI r3, 256
  STORE r6, r3
  LDI r6, 0x7001
  LDI r3, 181
  STORE r6, r3
  LDI r6, 0x7002
  LDI r3, 0
  STORE r6, r3
  LDI r6, 0x7003
  LDI r3, 0xFFFF73
  STORE r6, r3
  LDI r6, 0x7004
  LDI r3, 0xFFFFFF00
  STORE r6, r3
  LDI r6, 0x7005
  LDI r3, 0xFFFF73
  STORE r6, r3
  LDI r6, 0x7006
  LDI r3, 0
  STORE r6, r3
  LDI r6, 0x7007
  LDI r3, 181
  STORE r6, r3
  ; sin_table at 0x7010
  LDI r6, 0x7010
  LDI r3, 0
  STORE r6, r3
  LDI r6, 0x7011
  LDI r3, 181
  STORE r6, r3
  LDI r6, 0x7012
  LDI r3, 256
  STORE r6, r3
  LDI r6, 0x7013
  LDI r3, 181
  STORE r6, r3
  LDI r6, 0x7014
  LDI r3, 0
  STORE r6, r3
  LDI r6, 0x7015
  LDI r3, 0xFFFF73
  STORE r6, r3
  LDI r6, 0x7016
  LDI r3, 0xFFFFFF00
  STORE r6, r3
  LDI r6, 0x7017
  LDI r3, 0xFFFF73
  STORE r6, r3
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r3, 1
  LDI r6, 0x5500
  STORE r6, r3
  ; axiom: F--F--F (at 0x5000)
  LDI r6, 0x5000
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5001
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5002
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5003
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5004
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5005
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5006
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5007
  LDI r3, 0
  STORE r6, r3
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r3, 5
  LDI r6, 0x5502
  STORE r6, r3
  LDI r3, 10920
  LDI r6, 0x5503
  STORE r6, r3
  LDI r3, 0x00AAFF
  LDI r6, 0x5504
  STORE r6, r3
  LDI r3, 3
  LDI r6, 0x5501
  STORE r6, r3
  RET

store_koch_f:
  LDI r6, 0x5100
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5101
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5102
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5103
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5104
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5105
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5106
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5107
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5108
  LDI r3, 0
  STORE r6, r3
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r3, 2
  LDI r6, 0x5500
  STORE r6, r3
  ; axiom: F-G-G
  LDI r6, 0x5000
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5001
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5002
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5003
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5004
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5005
  LDI r3, 0
  STORE r6, r3
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r6, 0x5100
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5101
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5102
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5103
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5104
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5105
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5106
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5107
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5108
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5109
  LDI r3, 0
  STORE r6, r3
  ; rule G -> GG (at 0x5200)
  LDI r6, 0x5200
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5201
  LDI r3, 71
  STORE r6, r3
  LDI r6, 0x5202
  LDI r3, 0
  STORE r6, r3
  ; params
  LDI r3, 5
  LDI r6, 0x5502
  STORE r6, r3
  LDI r3, 21840
  LDI r6, 0x5503
  STORE r6, r3
  LDI r3, 0xFF6644
  LDI r6, 0x5504
  STORE r6, r3
  LDI r3, 5
  LDI r6, 0x5501
  STORE r6, r3
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r3, 3
  LDI r6, 0x5500
  STORE r6, r3
  ; axiom: FX
  LDI r6, 0x5000
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5001
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5002
  LDI r3, 0
  STORE r6, r3
  ; rule X -> X+YF+ (at 0x5300)
  LDI r6, 0x5300
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5301
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5302
  LDI r3, 89
  STORE r6, r3
  LDI r6, 0x5303
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5304
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5305
  LDI r3, 0
  STORE r6, r3
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r6, 0x5400
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5401
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5402
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5403
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5404
  LDI r3, 89
  STORE r6, r3
  LDI r6, 0x5405
  LDI r3, 0
  STORE r6, r3
  ; params
  LDI r3, 4
  LDI r6, 0x5502
  STORE r6, r3
  LDI r3, 16380
  LDI r6, 0x5503
  STORE r6, r3
  LDI r3, 0xFF2244
  LDI r6, 0x5504
  STORE r6, r3
  LDI r3, 8
  LDI r6, 0x5501
  STORE r6, r3
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r3, 4
  LDI r6, 0x5500
  STORE r6, r3
  ; axiom: X
  LDI r6, 0x5000
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5001
  LDI r3, 0
  STORE r6, r3
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r6, 0x5300
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5301
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5302
  LDI r3, 91
  STORE r6, r3
  LDI r6, 0x5303
  LDI r3, 91
  STORE r6, r3
  LDI r6, 0x5304
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5305
  LDI r3, 93
  STORE r6, r3
  LDI r6, 0x5306
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5307
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5308
  LDI r3, 93
  STORE r6, r3
  LDI r6, 0x5309
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x530A
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x530B
  LDI r3, 91
  STORE r6, r3
  LDI r6, 0x530C
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x530D
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x530E
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x530F
  LDI r3, 93
  STORE r6, r3
  LDI r6, 0x5310
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5311
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5312
  LDI r3, 0
  STORE r6, r3
  ; rule F -> FF (at 0x5100)
  LDI r6, 0x5100
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5101
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5102
  LDI r3, 0
  STORE r6, r3
  ; params
  LDI r3, 3
  LDI r6, 0x5502
  STORE r6, r3
  LDI r3, 4550
  LDI r6, 0x5503
  STORE r6, r3
  LDI r3, 0x22CC44
  LDI r6, 0x5504
  STORE r6, r3
  LDI r3, 4
  LDI r6, 0x5501
  STORE r6, r3
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r3, 5
  LDI r6, 0x5500
  STORE r6, r3
  ; axiom: X
  LDI r6, 0x5000
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5001
  LDI r3, 0
  STORE r6, r3
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r6, 0x5300
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5301
  LDI r3, 91
  STORE r6, r3
  LDI r6, 0x5302
  LDI r3, 43
  STORE r6, r3
  LDI r6, 0x5303
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5304
  LDI r3, 93
  STORE r6, r3
  LDI r6, 0x5305
  LDI r3, 91
  STORE r6, r3
  LDI r6, 0x5306
  LDI r3, 45
  STORE r6, r3
  LDI r6, 0x5307
  LDI r3, 88
  STORE r6, r3
  LDI r6, 0x5308
  LDI r3, 93
  STORE r6, r3
  LDI r6, 0x5309
  LDI r3, 0
  STORE r6, r3
  ; rule F -> FF (at 0x5100)
  LDI r6, 0x5100
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5101
  LDI r3, 70
  STORE r6, r3
  LDI r6, 0x5102
  LDI r3, 0
  STORE r6, r3
  ; params
  LDI r3, 4
  LDI r6, 0x5502
  STORE r6, r3
  LDI r3, 5460
  LDI r6, 0x5503
  STORE r6, r3
  LDI r3, 0x44AA22
  LDI r6, 0x5504
  STORE r6, r3
  LDI r3, 5
  LDI r6, 0x5501
  STORE r6, r3
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r0, 0x5000
  LDI r2, 0x2000
copy_axiom_lp:
  LDI r4, 0
  ADD r4, r0
  LOAD r10, r4
  JZ r10, axiom_copied
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10
  LDI r10, 1
  ADD r0, r10
  ADD r2, r10
  JMP copy_axiom_lp
axiom_copied:
  LDI r10, 0
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10

  ; get iteration count
  LDI r14, 0
  LDI r13, 0x5501
  LOAD r13, r13

expand_iter_lp:
  CMP r14, r13
  BGE r5, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r0, 0x2000
  LDI r2, 0x3000
exp_char_lp:
  LDI r4, 0
  ADD r4, r0
  LOAD r10, r4
  JZ r10, exp_copy_back

  ; check F
  LDI r4, 70
  CMP r10, r4
  JZ r5, exp_f
  ; check G
  LDI r4, 71
  CMP r10, r4
  JZ r5, exp_g
  ; check X
  LDI r4, 88
  CMP r10, r4
  JZ r5, exp_x
  ; check Y
  LDI r4, 89
  CMP r10, r4
  JZ r5, exp_y

  ; no rule -- copy char directly
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10
  LDI r10, 1
  ADD r2, r10
  LDI r10, 1
  ADD r0, r10
  JMP exp_char_lp

exp_f:
  LDI r10, 1
  ADD r0, r10
  LDI r10, 0x5100
  LDI r4, 0x5505
  STORE r4, r10
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r10, 1
  ADD r0, r10
  LDI r10, 0x5200
  LDI r4, 0x5505
  STORE r4, r10
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r10, 1
  ADD r0, r10
  LDI r10, 0x5300
  LDI r4, 0x5505
  STORE r4, r10
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r10, 1
  ADD r0, r10
  LDI r10, 0x5400
  LDI r4, 0x5505
  STORE r4, r10
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r10, 0
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10
  ; overflow check
  LDI r4, 0x3FFF
  CMP r2, r4
  BGE r5, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r0, 0x3000
  LDI r2, 0x2000
cp_back_lp:
  LDI r4, 0
  ADD r4, r0
  LOAD r10, r4
  JZ r10, cp_back_done
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10
  LDI r10, 1
  ADD r0, r10
  ADD r2, r10
  JMP cp_back_lp
cp_back_done:
  LDI r10, 0
  LDI r4, 0
  ADD r4, r2
  STORE r4, r10
  LDI r10, 1
  ADD r14, r10
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r2
; Advances r2 past copied chars
copy_rule:
  LDI r4, 0x5505
  LOAD r18, r4      ; r18 = rule base address
cp_rule_lp:
  LDI r4, 0
  ADD r4, r18
  LOAD r19, r4      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r4, 0
  ADD r4, r2
  STORE r4, r19
  LDI r19, 1
  ADD r2, r19
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
  LDI r0, 128
  LDI r2, 128
  LDI r4, 0

  ; load params
  LDI r6, 0x5504
  LOAD r14, r6       ; color
  LDI r6, 0x5503
  LOAD r13, r6       ; angle increment
  LDI r6, 0x5502
  LOAD r16, r6       ; line length

  ; position adjustments per preset
  LDI r6, 0x5500
  LOAD r17, r6
  LDI r18, 1
  CMP r17, r18
  JZ r5, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r5, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r5, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r5, pos_fern
  ; preset 5 tree
  LDI r2, 240
  LDI r4, 54600
  JMP pos_done

pos_koch:
  LDI r0, 20
  LDI r2, 180
  LDI r4, 54600
  JMP pos_done
pos_sierp:
  LDI r0, 30
  LDI r2, 200
  LDI r4, 0
  JMP pos_done
pos_drag:
  LDI r0, 128
  LDI r2, 128
  LDI r4, 0
  JMP pos_done
pos_fern:
  LDI r0, 128
  LDI r2, 240
  LDI r4, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r6, 0
  ADD r6, r20
  LOAD r8, r6
  JZ r8, turtle_done

  ; F = forward + draw
  LDI r6, 70
  CMP r8, r6
  JZ r5, t_fwd
  ; G = forward no draw
  LDI r6, 71
  CMP r8, r6
  JZ r5, t_move
  ; + = turn left
  LDI r6, 43
  CMP r8, r6
  JZ r5, t_left
  ; - = turn right
  LDI r6, 45
  CMP r8, r6
  JZ r5, t_right
  ; [ = push
  LDI r6, 91
  CMP r8, r6
  JZ r5, t_push
  ; ] = pop
  LDI r6, 93
  CMP r8, r6
  JZ r5, t_pop

  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r0, r2, r21, r22, r14
  MOV r0, r21
  MOV r2, r22
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r0, r21
  MOV r2, r22
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_left:
  ADD r4, r13
  LDI r6, 65536
  CMP r4, r6
  BLT r5, t_left_done
  SUB r4, r6
t_left_done:
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_right:
  SUB r4, r13
  ; If angle underflowed (bit 31 set), add 65536
  LDI r6, 31
  MOV r23, r4
  SHR r23, r6       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r6, 65536
  ADD r4, r6
t_right_done:
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_push:
  PUSH r0
  PUSH r2
  PUSH r4
  PUSH r31
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

t_pop:
  POP r31
  POP r4
  POP r2
  POP r0
  LDI r6, 1
  ADD r20, r6
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r0=x, r2=y, r4=angle(0-65535), r16=line_length
; Output: r21=x1, r22=y1
compute_end:
  PUSH r31
  ; sector = angle >> 13 (gives 0-7)
  MOV r21, r4
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
  ADD r21, r0

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r2

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r6, 0x5504
  LOAD r8, r6
  LDI r3, 0
  LDI r6, 0
  LDI r11, 256
  LDI r1, 6
  RECTF r3, r6, r11, r1, r8
  ; iteration dots
  LDI r6, 0x5501
  LOAD r0, r6
  LDI r3, 0
  LDI r6, 12
  LDI r11, 10
info_lp:
  CMP r3, r0
  BGE r5, info_done
  PSET r3, r6, r8
  ADD r3, r11
  JMP info_lp
info_done:
  POP r31
  RET
