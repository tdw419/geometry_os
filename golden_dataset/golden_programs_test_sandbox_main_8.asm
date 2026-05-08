; DESCRIPTION: A colored object centered at the screen with fixed size.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r2, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803
LDI r30, 0xFF00

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 0
STORE r25, r18
LDI r18, 0
STORE r26, r18
STORE r27, r18

; Spawn burst
LDI r13, 128
LDI r5, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r2
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r15, do_spawn

  JMP after_input

do_spawn:
  LDI r13, 128
  LDI r5, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r8, r26
  JZ r8, draw_hud

  LDI r7, 0

update_loop:
  MOV r4, r23
  MOV r3, r7
  LDI r18, 4
  MUL r3, r18
  ADD r4, r3

  LOAD r14, r4
  ADD r4, r2
  LOAD r11, r4
  ADD r4, r2
  LOAD r1, r4
  ADD r4, r2
  LOAD r6, r4

  ; Apply gravity
  PUSH r15
  LOAD r18, r24
  ADD r1, r18
  LOAD r18, r25
  ADD r6, r18
  POP r15

  ; Update position
  ADD r14, r1
  ADD r11, r6

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r4, r23
  MOV r3, r7
  LDI r18, 4
  MUL r3, r18
  ADD r4, r3

  STORE r4, r14
  ADD r4, r2
  STORE r4, r11
  ADD r4, r2
  STORE r4, r1
  ADD r4, r2
  STORE r4, r6

  ; Draw
  LDI r9, 0x00FF00
  PSET r14, r11, r9

  ADD r7, r2
  CMP r7, r8
  BLT r15, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r15
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r15, sb_done

  MOV r4, r23
  MOV r3, r18
  LDI r17, 4
  MUL r3, r17
  ADD r4, r3

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r13
  ADD r18, r17
  STORE r4, r18

  ADD r4, r2
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r5
  ADD r18, r17
  STORE r4, r18

  ADD r4, r2
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r4, r17

  ADD r4, r2
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r4, r17

  LOAD r18, r26
  ADD r18, r2
  STORE r26, r18

  SUB r16, r2
  JNZ r16, sb_loop

sb_done:
  POP r15
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r15

  ; Right wall
  LDI r18, 254
  CMP r14, r18
  BLT r15, bp_left
  LDI r14, 254
  NEG r1

bp_left:
  MOV r18, r14
  LDI r19, 0
  CMP r18, r19
  BGE r15, bp_bottom
  LDI r14, 0
  NEG r1

bp_bottom:
  LDI r18, 254
  CMP r11, r18
  BLT r15, bp_top
  LDI r11, 254
  NEG r6

bp_top:
  MOV r18, r11
  LDI r19, 0
  CMP r18, r19
  BGE r15, bp_done
  LDI r11, 0
  NEG r6

bp_done:
  POP r15
  POP r31
  RET
