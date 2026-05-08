; DESCRIPTION: Display a object using color colored at the screen.

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
  LDI r7, 49
  CMP r13, r7
  JZ r1, key_1
  ; key 2
  LDI r7, 50
  CMP r13, r7
  JZ r1, key_2
  ; key 3
  LDI r7, 51
  CMP r13, r7
  JZ r1, key_3
  ; key 4
  LDI r7, 52
  CMP r13, r7
  JZ r1, key_4
  ; key 5
  LDI r7, 53
  CMP r13, r7
  JZ r1, key_5
  ; + or =
  LDI r7, 43
  CMP r13, r7
  JZ r1, key_plus
  LDI r7, 61
  CMP r13, r7
  JZ r1, key_plus
  ; - or _
  LDI r7, 45
  CMP r13, r7
  JZ r1, key_minus
  LDI r7, 95
  CMP r13, r7
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
  LDI r12, 0x5501
  LOAD r8, r12
  LDI r14, 8
  CMP r8, r14
  BGE r1, main_loop
  LDI r14, 1
  ADD r8, r14
  STORE r12, r8
  JMP key_regen
key_minus:
  LDI r12, 0x5501
  LOAD r8, r12
  LDI r14, 1
  CMP r8, r14
  BLT r1, main_loop
  LDI r14, 1
  SUB r8, r14
  STORE r12, r8
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
  LDI r6, 256
  STORE r12, r6
  LDI r12, 0x7001
  LDI r6, 181
  STORE r12, r6
  LDI r12, 0x7002
  LDI r6, 0
  STORE r12, r6
  LDI r12, 0x7003
  LDI r6, 0xFFFF73
  STORE r12, r6
  LDI r12, 0x7004
  LDI r6, 0xFFFFFF00
  STORE r12, r6
  LDI r12, 0x7005
  LDI r6, 0xFFFF73
  STORE r12, r6
  LDI r12, 0x7006
  LDI r6, 0
  STORE r12, r6
  LDI r12, 0x7007
  LDI r6, 181
  STORE r12, r6
  ; sin_table at 0x7010
  LDI r12, 0x7010
  LDI r6, 0
  STORE r12, r6
  LDI r12, 0x7011
  LDI r6, 181
  STORE r12, r6
  LDI r12, 0x7012
  LDI r6, 256
  STORE r12, r6
  LDI r12, 0x7013
  LDI r6, 181
  STORE r12, r6
  LDI r12, 0x7014
  LDI r6, 0
  STORE r12, r6
  LDI r12, 0x7015
  LDI r6, 0xFFFF73
  STORE r12, r6
  LDI r12, 0x7016
  LDI r6, 0xFFFFFF00
  STORE r12, r6
  LDI r12, 0x7017
  LDI r6, 0xFFFF73
  STORE r12, r6
  RET

; ==== Preset: Koch Snowflake ====
init_koch:
  LDI r6, 1
  LDI r12, 0x5500
  STORE r12, r6
  ; axiom: F--F--F (at 0x5000)
  LDI r12, 0x5000
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5001
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5002
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5003
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5004
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5005
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5006
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5007
  LDI r6, 0
  STORE r12, r6
  ; rule F -> F+F--F+F (at 0x5100)
  CALL store_koch_f
  ; params
  LDI r6, 5
  LDI r12, 0x5502
  STORE r12, r6
  LDI r6, 10920
  LDI r12, 0x5503
  STORE r12, r6
  LDI r6, 0x00AAFF
  LDI r12, 0x5504
  STORE r12, r6
  LDI r6, 3
  LDI r12, 0x5501
  STORE r12, r6
  RET

store_koch_f:
  LDI r12, 0x5100
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5101
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5102
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5103
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5104
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5105
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5106
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5107
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5108
  LDI r6, 0
  STORE r12, r6
  RET

; ==== Preset: Sierpinski Triangle ====
init_sierpinski:
  LDI r6, 2
  LDI r12, 0x5500
  STORE r12, r6
  ; axiom: F-G-G
  LDI r12, 0x5000
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5001
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5002
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5003
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5004
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5005
  LDI r6, 0
  STORE r12, r6
  ; rule F -> F-G+F+G-F (at 0x5100)
  LDI r12, 0x5100
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5101
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5102
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5103
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5104
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5105
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5106
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5107
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5108
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5109
  LDI r6, 0
  STORE r12, r6
  ; rule G -> GG (at 0x5200)
  LDI r12, 0x5200
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5201
  LDI r6, 71
  STORE r12, r6
  LDI r12, 0x5202
  LDI r6, 0
  STORE r12, r6
  ; params
  LDI r6, 5
  LDI r12, 0x5502
  STORE r12, r6
  LDI r6, 21840
  LDI r12, 0x5503
  STORE r12, r6
  LDI r6, 0xFF6644
  LDI r12, 0x5504
  STORE r12, r6
  LDI r6, 5
  LDI r12, 0x5501
  STORE r12, r6
  RET

; ==== Preset: Dragon Curve ====
init_dragon:
  LDI r6, 3
  LDI r12, 0x5500
  STORE r12, r6
  ; axiom: FX
  LDI r12, 0x5000
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5001
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5002
  LDI r6, 0
  STORE r12, r6
  ; rule X -> X+YF+ (at 0x5300)
  LDI r12, 0x5300
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5301
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5302
  LDI r6, 89
  STORE r12, r6
  LDI r12, 0x5303
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5304
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5305
  LDI r6, 0
  STORE r12, r6
  ; rule Y -> -FX-Y (at 0x5400)
  LDI r12, 0x5400
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5401
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5402
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5403
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5404
  LDI r6, 89
  STORE r12, r6
  LDI r12, 0x5405
  LDI r6, 0
  STORE r12, r6
  ; params
  LDI r6, 4
  LDI r12, 0x5502
  STORE r12, r6
  LDI r6, 16380
  LDI r12, 0x5503
  STORE r12, r6
  LDI r6, 0xFF2244
  LDI r12, 0x5504
  STORE r12, r6
  LDI r6, 8
  LDI r12, 0x5501
  STORE r12, r6
  RET

; ==== Preset: Fern ====
init_fern:
  LDI r6, 4
  LDI r12, 0x5500
  STORE r12, r6
  ; axiom: X
  LDI r12, 0x5000
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5001
  LDI r6, 0
  STORE r12, r6
  ; rule X -> F+[[X]-X]-F[-FX]+X (at 0x5300)
  LDI r12, 0x5300
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5301
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5302
  LDI r6, 91
  STORE r12, r6
  LDI r12, 0x5303
  LDI r6, 91
  STORE r12, r6
  LDI r12, 0x5304
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5305
  LDI r6, 93
  STORE r12, r6
  LDI r12, 0x5306
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5307
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5308
  LDI r6, 93
  STORE r12, r6
  LDI r12, 0x5309
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x530A
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x530B
  LDI r6, 91
  STORE r12, r6
  LDI r12, 0x530C
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x530D
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x530E
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x530F
  LDI r6, 93
  STORE r12, r6
  LDI r12, 0x5310
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5311
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5312
  LDI r6, 0
  STORE r12, r6
  ; rule F -> FF (at 0x5100)
  LDI r12, 0x5100
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5101
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5102
  LDI r6, 0
  STORE r12, r6
  ; params
  LDI r6, 3
  LDI r12, 0x5502
  STORE r12, r6
  LDI r6, 4550
  LDI r12, 0x5503
  STORE r12, r6
  LDI r6, 0x22CC44
  LDI r12, 0x5504
  STORE r12, r6
  LDI r6, 4
  LDI r12, 0x5501
  STORE r12, r6
  RET

; ==== Preset: Tree ====
init_tree:
  LDI r6, 5
  LDI r12, 0x5500
  STORE r12, r6
  ; axiom: X
  LDI r12, 0x5000
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5001
  LDI r6, 0
  STORE r12, r6
  ; rule X -> F[+X][-X] (at 0x5300)
  LDI r12, 0x5300
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5301
  LDI r6, 91
  STORE r12, r6
  LDI r12, 0x5302
  LDI r6, 43
  STORE r12, r6
  LDI r12, 0x5303
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5304
  LDI r6, 93
  STORE r12, r6
  LDI r12, 0x5305
  LDI r6, 91
  STORE r12, r6
  LDI r12, 0x5306
  LDI r6, 45
  STORE r12, r6
  LDI r12, 0x5307
  LDI r6, 88
  STORE r12, r6
  LDI r12, 0x5308
  LDI r6, 93
  STORE r12, r6
  LDI r12, 0x5309
  LDI r6, 0
  STORE r12, r6
  ; rule F -> FF (at 0x5100)
  LDI r12, 0x5100
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5101
  LDI r6, 70
  STORE r12, r6
  LDI r12, 0x5102
  LDI r6, 0
  STORE r12, r6
  ; params
  LDI r6, 4
  LDI r12, 0x5502
  STORE r12, r6
  LDI r6, 5460
  LDI r12, 0x5503
  STORE r12, r6
  LDI r6, 0x44AA22
  LDI r12, 0x5504
  STORE r12, r6
  LDI r6, 5
  LDI r12, 0x5501
  STORE r12, r6
  RET

; ==== String Expansion Engine ====
; Expands axiom using L-system rules iteratively
; Source at 0x2000, output at 0x3000
do_expand:
  PUSH r31
  ; copy axiom (0x5000) to source buffer (0x2000)
  LDI r13, 0x5000
  LDI r7, 0x2000
copy_axiom_lp:
  LDI r10, 0
  ADD r10, r13
  LOAD r2, r10
  JZ r2, axiom_copied
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2
  LDI r2, 1
  ADD r13, r2
  ADD r7, r2
  JMP copy_axiom_lp
axiom_copied:
  LDI r2, 0
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2

  ; get iteration count
  LDI r0, 0
  LDI r15, 0x5501
  LOAD r15, r15

expand_iter_lp:
  CMP r0, r15
  BGE r1, expand_done

  ; expand: read 0x2000, write 0x3000
  LDI r13, 0x2000
  LDI r7, 0x3000
exp_char_lp:
  LDI r10, 0
  ADD r10, r13
  LOAD r2, r10
  JZ r2, exp_copy_back

  ; check F
  LDI r10, 70
  CMP r2, r10
  JZ r1, exp_f
  ; check G
  LDI r10, 71
  CMP r2, r10
  JZ r1, exp_g
  ; check X
  LDI r10, 88
  CMP r2, r10
  JZ r1, exp_x
  ; check Y
  LDI r10, 89
  CMP r2, r10
  JZ r1, exp_y

  ; no rule -- copy char directly
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2
  LDI r2, 1
  ADD r7, r2
  LDI r2, 1
  ADD r13, r2
  JMP exp_char_lp

exp_f:
  LDI r2, 1
  ADD r13, r2
  LDI r2, 0x5100
  LDI r10, 0x5505
  STORE r10, r2
  CALL copy_rule
  JMP exp_char_lp

exp_g:
  LDI r2, 1
  ADD r13, r2
  LDI r2, 0x5200
  LDI r10, 0x5505
  STORE r10, r2
  CALL copy_rule
  JMP exp_char_lp

exp_x:
  LDI r2, 1
  ADD r13, r2
  LDI r2, 0x5300
  LDI r10, 0x5505
  STORE r10, r2
  CALL copy_rule
  JMP exp_char_lp

exp_y:
  LDI r2, 1
  ADD r13, r2
  LDI r2, 0x5400
  LDI r10, 0x5505
  STORE r10, r2
  CALL copy_rule
  JMP exp_char_lp

exp_copy_back:
  ; null-terminate output
  LDI r2, 0
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2
  ; overflow check
  LDI r10, 0x3FFF
  CMP r7, r10
  BGE r1, expand_done
  ; copy 0x3000 back to 0x2000
  LDI r13, 0x3000
  LDI r7, 0x2000
cp_back_lp:
  LDI r10, 0
  ADD r10, r13
  LOAD r2, r10
  JZ r2, cp_back_done
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2
  LDI r2, 1
  ADD r13, r2
  ADD r7, r2
  JMP cp_back_lp
cp_back_done:
  LDI r2, 0
  LDI r10, 0
  ADD r10, r7
  STORE r10, r2
  LDI r2, 1
  ADD r0, r2
  JMP expand_iter_lp

expand_done:
  POP r31
  RET

; Copy rule string from RAM[0x5505] to output at r7
; Advances r7 past copied chars
copy_rule:
  LDI r10, 0x5505
  LOAD r18, r10      ; r18 = rule base address
cp_rule_lp:
  LDI r10, 0
  ADD r10, r18
  LOAD r19, r10      ; r19 = rule char
  JZ r19, cp_rule_done
  LDI r10, 0
  ADD r10, r7
  STORE r10, r19
  LDI r19, 1
  ADD r7, r19
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
  LDI r7, 128
  LDI r10, 0

  ; load params
  LDI r12, 0x5504
  LOAD r0, r12       ; color
  LDI r12, 0x5503
  LOAD r15, r12       ; angle increment
  LDI r12, 0x5502
  LOAD r16, r12       ; line length

  ; position adjustments per preset
  LDI r12, 0x5500
  LOAD r17, r12
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
  LDI r7, 240
  LDI r10, 54600
  JMP pos_done

pos_koch:
  LDI r13, 20
  LDI r7, 180
  LDI r10, 54600
  JMP pos_done
pos_sierp:
  LDI r13, 30
  LDI r7, 200
  LDI r10, 0
  JMP pos_done
pos_drag:
  LDI r13, 128
  LDI r7, 128
  LDI r10, 0
  JMP pos_done
pos_fern:
  LDI r13, 128
  LDI r7, 240
  LDI r10, 54600
  JMP pos_done
pos_done:

  ; iterate over expanded string at 0x2000
  LDI r20, 0x2000
turtle_lp:
  LDI r12, 0
  ADD r12, r20
  LOAD r8, r12
  JZ r8, turtle_done

  ; F = forward + draw
  LDI r12, 70
  CMP r8, r12
  JZ r1, t_fwd
  ; G = forward no draw
  LDI r12, 71
  CMP r8, r12
  JZ r1, t_move
  ; + = turn left
  LDI r12, 43
  CMP r8, r12
  JZ r1, t_left
  ; - = turn right
  LDI r12, 45
  CMP r8, r12
  JZ r1, t_right
  ; [ = push
  LDI r12, 91
  CMP r8, r12
  JZ r1, t_push
  ; ] = pop
  LDI r12, 93
  CMP r8, r12
  JZ r1, t_pop

  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_fwd:
  CALL compute_end
  LINE r13, r7, r21, r22, r0
  MOV r13, r21
  MOV r7, r22
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_move:
  CALL compute_end
  MOV r13, r21
  MOV r7, r22
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_left:
  ADD r10, r15
  LDI r12, 65536
  CMP r10, r12
  BLT r1, t_left_done
  SUB r10, r12
t_left_done:
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_right:
  SUB r10, r15
  ; If angle underflowed (bit 31 set), add 65536
  LDI r12, 31
  MOV r23, r10
  SHR r23, r12       ; r23 = sign bit
  JZ r23, t_right_done
  LDI r12, 65536
  ADD r10, r12
t_right_done:
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_push:
  PUSH r13
  PUSH r7
  PUSH r10
  PUSH r31
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

t_pop:
  POP r31
  POP r10
  POP r7
  POP r13
  LDI r12, 1
  ADD r20, r12
  JMP turtle_lp

turtle_done:
  POP r31
  RET

; ==== Compute Endpoint ====
; r13=x, r7=y, r10=angle(0-65535), r16=line_length
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
  ADD r21, r13

  ; y1 = y - (length * sin) / 256 (y inverted)
  MOV r22, r16
  MUL r22, r25
  LDI r23, 256
  DIV r22, r23
  SUB r22, r7

  POP r31
  RET

; ==== Info Overlay ====
draw_info:
  PUSH r31
  ; colored bar at top
  LDI r12, 0x5504
  LOAD r8, r12
  LDI r6, 0
  LDI r12, 0
  LDI r14, 256
  LDI r11, 6
  RECTF r6, r12, r14, r11, r8
  ; iteration dots
  LDI r12, 0x5501
  LOAD r13, r12
  LDI r6, 0
  LDI r12, 12
  LDI r14, 10
info_lp:
  CMP r6, r13
  BGE r1, info_done
  PSET r6, r12, r8
  ADD r6, r14
  JMP info_lp
info_done:
  POP r31
  RET
