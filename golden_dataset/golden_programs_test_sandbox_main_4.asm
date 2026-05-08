; DESCRIPTION: Render a colored object at the screen.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r7, 1
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
LDI r15, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r7
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r5, do_spawn

  JMP after_input

do_spawn:
  LDI r13, 128
  LDI r15, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r1, r26
  JZ r1, draw_hud

  LDI r14, 0

update_loop:
  MOV r4, r23
  MOV r0, r14
  LDI r18, 4
  MUL r0, r18
  ADD r4, r0

  LOAD r12, r4
  ADD r4, r7
  LOAD r8, r4
  ADD r4, r7
  LOAD r9, r4
  ADD r4, r7
  LOAD r11, r4

  ; Apply gravity
  PUSH r5
  LOAD r18, r24
  ADD r9, r18
  LOAD r18, r25
  ADD r11, r18
  POP r5

  ; Update position
  ADD r12, r9
  ADD r8, r11

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r4, r23
  MOV r0, r14
  LDI r18, 4
  MUL r0, r18
  ADD r4, r0

  STORE r4, r12
  ADD r4, r7
  STORE r4, r8
  ADD r4, r7
  STORE r4, r9
  ADD r4, r7
  STORE r4, r11

  ; Draw
  LDI r2, 0x00FF00
  PSET r12, r8, r2

  ADD r14, r7
  CMP r14, r1
  BLT r5, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r5
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r5, sb_done

  MOV r4, r23
  MOV r0, r18
  LDI r17, 4
  MUL r0, r17
  ADD r4, r0

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r13
  ADD r18, r17
  STORE r4, r18

  ADD r4, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r15
  ADD r18, r17
  STORE r4, r18

  ADD r4, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r4, r17

  ADD r4, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r4, r17

  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r5
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r5

  ; Right wall
  LDI r18, 254
  CMP r12, r18
  BLT r5, bp_left
  LDI r12, 254
  NEG r9

bp_left:
  MOV r18, r12
  LDI r19, 0
  CMP r18, r19
  BGE r5, bp_bottom
  LDI r12, 0
  NEG r9

bp_bottom:
  LDI r18, 254
  CMP r8, r18
  BLT r5, bp_top
  LDI r8, 254
  NEG r11

bp_top:
  MOV r18, r8
  LDI r19, 0
  CMP r18, r19
  BGE r5, bp_done
  LDI r8, 0
  NEG r11

bp_done:
  POP r5
  POP r31
  RET
