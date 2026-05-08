; DESCRIPTION: A colored object centered at the screen with fixed size.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r15, 1
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
LDI r14, 128
LDI r3, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r15
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r7, do_spawn

  JMP after_input

do_spawn:
  LDI r14, 128
  LDI r3, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r4, r26
  JZ r4, draw_hud

  LDI r1, 0

update_loop:
  MOV r11, r23
  MOV r8, r1
  LDI r18, 4
  MUL r8, r18
  ADD r11, r8

  LOAD r5, r11
  ADD r11, r15
  LOAD r12, r11
  ADD r11, r15
  LOAD r2, r11
  ADD r11, r15
  LOAD r10, r11

  ; Apply gravity
  PUSH r7
  LOAD r18, r24
  ADD r2, r18
  LOAD r18, r25
  ADD r10, r18
  POP r7

  ; Update position
  ADD r5, r2
  ADD r12, r10

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r11, r23
  MOV r8, r1
  LDI r18, 4
  MUL r8, r18
  ADD r11, r8

  STORE r11, r5
  ADD r11, r15
  STORE r11, r12
  ADD r11, r15
  STORE r11, r2
  ADD r11, r15
  STORE r11, r10

  ; Draw
  LDI r9, 0x00FF00
  PSET r5, r12, r9

  ADD r1, r15
  CMP r1, r4
  BLT r7, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r7
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r7, sb_done

  MOV r11, r23
  MOV r8, r18
  LDI r17, 4
  MUL r8, r17
  ADD r11, r8

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r14
  ADD r18, r17
  STORE r11, r18

  ADD r11, r15
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r3
  ADD r18, r17
  STORE r11, r18

  ADD r11, r15
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r11, r17

  ADD r11, r15
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r11, r17

  LOAD r18, r26
  ADD r18, r15
  STORE r26, r18

  SUB r16, r15
  JNZ r16, sb_loop

sb_done:
  POP r7
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r7

  ; Right wall
  LDI r18, 254
  CMP r5, r18
  BLT r7, bp_left
  LDI r5, 254
  NEG r2

bp_left:
  MOV r18, r5
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_bottom
  LDI r5, 0
  NEG r2

bp_bottom:
  LDI r18, 254
  CMP r12, r18
  BLT r7, bp_top
  LDI r12, 254
  NEG r10

bp_top:
  MOV r18, r12
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_done
  LDI r12, 0
  NEG r10

bp_done:
  POP r7
  POP r31
  RET
