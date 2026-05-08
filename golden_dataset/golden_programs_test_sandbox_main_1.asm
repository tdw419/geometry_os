; DESCRIPTION: Geometry OS program to draw a colored object.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r5, 1
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
LDI r11, 128
LDI r12, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r5
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r13, do_spawn

  JMP after_input

do_spawn:
  LDI r11, 128
  LDI r12, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r0, r26
  JZ r0, draw_hud

  LDI r9, 0

update_loop:
  MOV r6, r23
  MOV r2, r9
  LDI r18, 4
  MUL r2, r18
  ADD r6, r2

  LOAD r7, r6
  ADD r6, r5
  LOAD r15, r6
  ADD r6, r5
  LOAD r8, r6
  ADD r6, r5
  LOAD r3, r6

  ; Apply gravity
  PUSH r13
  LOAD r18, r24
  ADD r8, r18
  LOAD r18, r25
  ADD r3, r18
  POP r13

  ; Update position
  ADD r7, r8
  ADD r15, r3

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r6, r23
  MOV r2, r9
  LDI r18, 4
  MUL r2, r18
  ADD r6, r2

  STORE r6, r7
  ADD r6, r5
  STORE r6, r15
  ADD r6, r5
  STORE r6, r8
  ADD r6, r5
  STORE r6, r3

  ; Draw
  LDI r4, 0x00FF00
  PSET r7, r15, r4

  ADD r9, r5
  CMP r9, r0
  BLT r13, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r13
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r13, sb_done

  MOV r6, r23
  MOV r2, r18
  LDI r17, 4
  MUL r2, r17
  ADD r6, r2

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r11
  ADD r18, r17
  STORE r6, r18

  ADD r6, r5
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r12
  ADD r18, r17
  STORE r6, r18

  ADD r6, r5
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r6, r17

  ADD r6, r5
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r6, r17

  LOAD r18, r26
  ADD r18, r5
  STORE r26, r18

  SUB r16, r5
  JNZ r16, sb_loop

sb_done:
  POP r13
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r13

  ; Right wall
  LDI r18, 254
  CMP r7, r18
  BLT r13, bp_left
  LDI r7, 254
  NEG r8

bp_left:
  MOV r18, r7
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_bottom
  LDI r7, 0
  NEG r8

bp_bottom:
  LDI r18, 254
  CMP r15, r18
  BLT r13, bp_top
  LDI r15, 254
  NEG r3

bp_top:
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_done
  LDI r15, 0
  NEG r3

bp_done:
  POP r13
  POP r31
  RET
