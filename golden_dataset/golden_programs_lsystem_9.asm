; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
  IKEY r1
  JZ r1, main_loop

  ; key 1
  LDI r6, 49
  CMP r1, r6
  JZ r8, key_1
  ; key 2
  LDI r6, 50
  CMP r1, r6
  JZ r8, key_2
  ; key 3
  LDI r6, 51
  CMP r1, r6
  JZ r8, key_3
  ; key 4
  LDI r6, 52
  CMP r1, r6
  JZ r8, key_4
  ; key 5
  LDI r6, 53
  CMP r1, r6
  JZ r8, key_5
  ; + or =
  LDI r6, 43
  CMP r1, r6
  JZ r8, key_plus
  LDI r6, 61
  CMP r1, r6
  JZ r8, key_plus
  ; - or _
  LDI r6, 45
  CMP r1, r6
  JZ r8, key_minus
  LDI r6, 95
  CMP r1, r6
  JZ r8, key_minus

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
  LDI r11, 0x5501
  LOAD r14, r11
  LDI r12, 8
  CMP r14, r12
  BGE r8, main_loop
  LDI r12, 1
  ADD r14, r12
  STORE r11, r14
  JMP key_regen
key_minus:
  LDI r11, 0x5501
  LOAD r14, r11
  LDI r12, 1
  CMP r14, r12
  BLT r8, main_loop
  LDI r12, 1
  SUB r14, r12
  STORE r11, r14
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
  LDI r11, 0x7000
  LDI r13, 256
  STORE r11, r13
  LDI r11, 0x7001
  LDI r13, 181
  STORE r11, r13
  LDI r11, 0x7002
  LDI r13, 0
  STORE r11, r13
  LDI r11, 0x7003
  LDI r13, 0xFFFF73
  STORE r11, r13
  LDI r11, 0x7004
  LDI r13, 0xFFFFFF00
  STORE r11, r13
  LDI r11, 0x7005
  LDI r13, 0xFFFF73
  STORE r11, r13
  LDI r11, 0x7006
  LDI r13, 0
  STORE r11, r13
  LDI r11, 0x7007
  LDI r13, 181
  STORE r11, r13
  ; sin_table at 0x7010
  LDI r11, 0x7010
  LDI r13, 0
  STORE r11, r13
  LDI r11, 0x7011
  LDI r13, 181
  STORE r11, r13
  LDI r11, 0x7012
  LDI r13, 256
  STORE r11, r13
  LDI r11, 0x7013
  LDI r13, 181
  STORE r11, r13
  LDI r11, 0x7014
  LDI r13, 0
  STORE r11, r13
  LDI r11, 0x7015
  LDI r13, 0xFFFF73
  STORE r11, r13
  LDI r11, 0x7016
  LDI r13, 0xFFFFFF00
  STORE r11, r13
  LDI r11, 0x7017
  LDI r13, 0xFFFF73
  STORE r11, r13
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r13, 1
  LDI r11, 0x5500
  STORE r11, r13
  ; axiom: F--F--F (at 0x5000)
  LDI r11, 0x5000
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5001
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5002
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5003
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5004
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5005
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5006
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5007
  LDI r13, 0
  STORE r11, r13
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r13, 5
  LDI r11, 0x5502
  STORE r11, r13
  LDI r13, 10920
  LDI r11, 0x5503
  STORE r11, r13
  LDI r13, 0x00AAFF
  LDI r11, 0x5504
  STORE r11, r13
  LDI r13, 3
  LDI r11, 0x5501
  STORE r11, r13
  RET

store_koch_f:
  LDI r11, 0x5100
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5101
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5102
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5103
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5104
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5105
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5106
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5107
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5108
  LDI r13, 0
  STORE r11, r13
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r13, 2
  LDI r11, 0x5500
  STORE r11, r13
  ; axiom: F-G-G
  LDI r11, 0x5000
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5001
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5002
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5003
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5004
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5005
  LDI r13, 0
  STORE r11, r13
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r11, 0x5100
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5101
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5102
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5103
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5104
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5105
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5106
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5107
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5108
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5109
  LDI r13, 0
  STORE r11, r13
  ; rule G -> GG (at 0x5200)
  LDI r11, 0x5200
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5201
  LDI r13, 71
  STORE r11, r13
  LDI r11, 0x5202
  LDI r13, 0
  STORE r11, r13
  ; params
  LDI r13, 5
  LDI r11, 0x5502
  STORE r11, r13
  LDI r13, 21840
  LDI r11, 0x5503
  STORE r11, r13
  LDI r13, 0xFF6644
  LDI r11, 0x5504
  STORE r11, r13
  LDI r13, 5
  LDI r11, 0x5501
  STORE r11, r13
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r13, 3
  LDI r11, 0x5500
  STORE r11, r13
  ; axiom: FX
  LDI r11, 0x5000
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5001
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5002
  LDI r13, 0
  STORE r11, r13
  ; rule X -> X+YF+ (at 0x5300)
  LDI r11, 0x5300
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5301
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5302
  LDI r13, 89
  STORE r11, r13
  LDI r11, 0x5303
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5304
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5305
  LDI r13, 0
  STORE r11, r13
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r11, 0x5400
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5401
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5402
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5403
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5404
  LDI r13, 89
  STORE r11, r13
  LDI r11, 0x5405
  LDI r13, 0
  STORE r11, r13
  ; params
  LDI r13, 4
  LDI r11, 0x5502
  STORE r11, r13
  LDI r13, 16380
  LDI r11, 0x5503
  STORE r11, r13
  LDI r13, 0xFF2244
  LDI r11, 0x5504
  STORE r11, r13
  LDI r13, 8
  LDI r11, 0x5501
  STORE r11, r13
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r13, 4
  LDI r11, 0x5500
  STORE r11, r13
  ; axiom: X
  LDI r11, 0x5000
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5001
  LDI r13, 0
  STORE r11, r13
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r11, 0x5300
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5301
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5302
  LDI r13, 91
  STORE r11, r13
  LDI r11, 0x5303
  LDI r13, 91
  STORE r11, r13
  LDI r11, 0x5304
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5305
  LDI r13, 93
  STORE r11, r13
  LDI r11, 0x5306
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5307
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5308
  LDI r13, 93
  STORE r11, r13
  LDI r11, 0x5309
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x530A
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x530B
  LDI r13, 91
  STORE r11, r13
  LDI r11, 0x530C
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x530D
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x530E
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x530F
  LDI r13, 93
  STORE r11, r13
  LDI r11, 0x5310
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5311
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5312
  LDI r13, 0
  STORE r11, r13
  ; rule F -> FF (at 0x5100)
  LDI r11, 0x5100
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5101
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5102
  LDI r13, 0
  STORE r11, r13
  ; params
  LDI r13, 3
  LDI r11, 0x5502
  STORE r11, r13
  LDI r13, 4550
  LDI r11, 0x5503
  STORE r11, r13
  LDI r13, 0x22CC44
  LDI r11, 0x5504
  STORE r11, r13
  LDI r13, 4
  LDI r11, 0x5501
  STORE r11, r13
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r13, 5
  LDI r11, 0x5500
  STORE r11, r13
  ; axiom: X
  LDI r11, 0x5000
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5001
  LDI r13, 0
  STORE r11, r13
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r11, 0x5300
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5301
  LDI r13, 91
  STORE r11, r13
  LDI r11, 0x5302
  LDI r13, 43
  STORE r11, r13
  LDI r11, 0x5303
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5304
  LDI r13, 93
  STORE r11, r13
  LDI r11, 0x5305
  LDI r13, 91
  STORE r11, r13
  LDI r11, 0x5306
  LDI r13, 45
  STORE r11, r13
  LDI r11, 0x5307
  LDI r13, 88
  STORE r11, r13
  LDI r11, 0x5308
  LDI r13, 93
  STORE r11, r13
  LDI r11, 0x5309
  LDI r13, 0
  STORE r11, r13
  ; rule F -> FF (at 0x5100)
  LDI r11, 0x5100
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5101
  LDI r13, 70
  STORE r11, r13
  LDI r11, 0x5102
  LDI r13, 0
  STORE r11, r13
  ; params
  LDI r13, 4
  LDI r11, 0x5502
  STORE r11, r13
  LDI r13, 5460
  LDI r11, 0x5503
  STORE r11, r13
  LDI r13, 0x44AA22
  LDI r11, 0x5504
  STORE r11, r13
  LDI r13, 5
  LDI r11, 0x5501
  STORE r11, r13
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r1, 0x5000
  LDI r6, 0x2000
copy_axiom_lp:
  LDI r4, 0
  ADD r4, r1
  LOAD r5, r4
  JZ r5, axiom_copied
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5
  LDI r5, 1
  ADD r1, r5
  ADD r6, r5
  JMP copy_axiom_lp
axiom_copied:
  LDI r5, 0
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5

  ; get iteration count
  LDI r15, 0
  LDI r10, 0x5501
  LOAD r10, r10

expand_iter_lp:
  CMP r15, r10
  BGE r8, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r1, 0x2000
  LDI r6, 0x3000
exp_char_lp:
  LDI r4, 0
  ADD r4, r1
  LOAD r5, r4
  JZ r5, exp_copy_back

  ; check F
  LDI r4, 70
  CMP r5, r4
  JZ r8, exp_f
  ; check G
  LDI r4, 71
  CMP r5, r4
  JZ r8, exp_g
  ; check X
  LDI r4, 88
  CMP r5, r4
  JZ r8, exp_x
  ; check Y
  LDI r4, 89
  CMP r5, r4
  JZ r8, exp_y

  ; no rule -- copy char directly
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5
  LDI r5, 1
  ADD r6, r5
  LDI r5, 1
  ADD r1, r5
  JMP exp_char_lp

exp_f:
  LDI r5, 1
  ADD r1, r5
  LDI r5, 0x5100
  LDI r4, 0x5505
  STORE r4, r5
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r5, 1
  ADD r1, r5
  LDI r5, 0x5200
  LDI r4, 0x5505
  STORE r4, r5
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r5, 1
  ADD r1, r5
  LDI r5, 0x5300
  LDI r4, 0x5505
  STORE r4, r5
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r5, 1
  ADD r1, r5
  LDI r5, 0x5400
  LDI r4, 0x5505
  STORE r4, r5
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r5, 0
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5
  ; overflow check
  LDI r4, 0x3FFF
  CMP r6, r4
  BGE r8, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r1, 0x3000
  LDI r6, 0x2000
cp_back_lp:
  LDI r4, 0
  ADD r4, r1
  LOAD r5, r4
  JZ r5, cp_back_done
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5
  LDI r5, 1
  ADD r1, r5
  ADD r6, r5
  JMP cp_back_lp
cp_back_done:
  LDI r5, 0
  LDI r4, 0
  ADD r4, r6
  STORE r4, r5
  LDI r5, 1
  ADD r15, r5
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r6
; Advances r6 past copied chars
copy_rule:
  LDI r4, 0x5505
  LOAD r18, r4      ; r18 = rule base address
cp_rule_lp:
  LDI r4, 0
  ADD r4, r18
  LOAD r19, r4      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r4, 0
  ADD r4, r6
  STORE r4, r19
  LDI r19, 1
  ADD r6, r19
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
  LDI r1, 128
  LDI r6, 128
  LDI r4, 0

  ; load params
  LDI r11, 0x5504
  LOAD r15, r11       ; color
  LDI r11, 0x5503
  LOAD r10, r11       ; angle increment
  LDI r11, 0x5502
  LOAD r16, r11       ; line length

  ; position adjustments per preset
  LDI r11, 0x5500
  LOAD r17, r11
  LDI r18, 1
  CMP r17, r18
  JZ r8, pos_koch
  LDI r18, 2
  CMP r17, r18
  JZ r8, pos_sierp
  LDI r18, 3
  CMP r17, r18
  JZ r8, pos_drag
  LDI r18, 4
  CMP r17, r18
  JZ r8, pos_fern
  ; preset 5 tree
  LDI r6, 240
  LDI r4, 54600
  JMP pos_done

pos_koch:
  LDI r1, 20
  LDI r6, 180
  LDI r4, 54600
  JMP pos_done
pos_sierp:
  LDI r1, 30
  LDI r6, 200
  LDI r4, 0
  JMP pos_done
pos_drag:
  LDI r1, 128
  LDI r6, 128
  LDI r4, 0
  JMP pos_done
pos_fern:
  LDI r1, 128
  LDI r6, 240
  LDI r4, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r11, 0
  ADD r11, r20
  LOAD r14, r11
  JZ r14, turtle_done

  ; F = forward + draw
  LDI r11, 70
  CMP r14, r11
  JZ r8, t_fwd
  ; G = forward no draw
  LDI r11, 71
  CMP r14, r11
  JZ r8, t_move
  ; + = turn left
  LDI r11, 43
  CMP r14, r11
  JZ r8, t_left
  ; - = turn right
  LDI r11, 45
  CMP r14, r11
  JZ r8, t_right
  ; [ = push
  LDI r11, 91
  CMP r14, r11
  JZ r8, t_push
  ; ] = pop
  LDI r11, 93
  CMP r14, r11
  JZ r8, t_pop

  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r1, r6, r21, r22, r15
  MOV r1, r21
  MOV r6, r22
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r1, r21
  MOV r6, r22
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_left:
  ADD r4, r10
  LDI r11, 65536
  CMP r4, r11
  BLT r8, t_left_done
  SUB r4, r11
t_left_done:
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_right:
  SUB r4, r10
  ; If angle underflowed (bit 31 set), add 65536
  LDI r11, 31
  MOV r23, r4
  SHR r23, r11       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r11, 65536
  ADD r4, r11
t_right_done:
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_push:
  PUSH r1
  PUSH r6
  PUSH r4
  PUSH r31
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

t_pop:
  POP r31
  POP r4
  POP r6
  POP r1
  LDI r11, 1
  ADD r20, r11
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r1=x, r6=y, r4=angle(0-65535), r16=line_length
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
  ADD r21, r1

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r6

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r11, 0x5504
  LOAD r14, r11
  LDI r13, 0
  LDI r11, 0
  LDI r12, 256
  LDI r0, 6
  RECTF r13, r11, r12, r0, r14
  ; iteration dots
  LDI r11, 0x5501
  LOAD r1, r11
  LDI r13, 0
  LDI r11, 12
  LDI r12, 10
info_lp:
  CMP r13, r1
  BGE r8, info_done
  PSET r13, r11, r14
  ADD r13, r12
  JMP info_lp
info_done:
  POP r31
  RET
