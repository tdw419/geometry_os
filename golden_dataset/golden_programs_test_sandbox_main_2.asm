; DESCRIPTION: Draws a colored object at the screen with fixed size.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r8, 1
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
LDI r6, 128
LDI r10, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r8
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r4, do_spawn

  JMP after_input

do_spawn:
  LDI r6, 128
  LDI r10, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r1, r26
  JZ r1, draw_hud

  LDI r2, 0

update_loop:
  MOV r0, r23
  MOV r7, r2
  LDI r18, 4
  MUL r7, r18
  ADD r0, r7

  LOAD r11, r0
  ADD r0, r8
  LOAD r15, r0
  ADD r0, r8
  LOAD r14, r0
  ADD r0, r8
  LOAD r5, r0

  ; Apply gravity
  PUSH r4
  LOAD r18, r24
  ADD r14, r18
  LOAD r18, r25
  ADD r5, r18
  POP r4

  ; Update position
  ADD r11, r14
  ADD r15, r5

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r0, r23
  MOV r7, r2
  LDI r18, 4
  MUL r7, r18
  ADD r0, r7

  STORE r0, r11
  ADD r0, r8
  STORE r0, r15
  ADD r0, r8
  STORE r0, r14
  ADD r0, r8
  STORE r0, r5

  ; Draw
  LDI r13, 0x00FF00
  PSET r11, r15, r13

  ADD r2, r8
  CMP r2, r1
  BLT r4, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r4
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r4, sb_done

  MOV r0, r23
  MOV r7, r18
  LDI r17, 4
  MUL r7, r17
  ADD r0, r7

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r6
  ADD r18, r17
  STORE r0, r18

  ADD r0, r8
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r0, r18

  ADD r0, r8
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r0, r17

  ADD r0, r8
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r0, r17

  LOAD r18, r26
  ADD r18, r8
  STORE r26, r18

  SUB r16, r8
  JNZ r16, sb_loop

sb_done:
  POP r4
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r4

  ; Right wall
  LDI r18, 254
  CMP r11, r18
  BLT r4, bp_left
  LDI r11, 254
  NEG r14

bp_left:
  MOV r18, r11
  LDI r19, 0
  CMP r18, r19
  BGE r4, bp_bottom
  LDI r11, 0
  NEG r14

bp_bottom:
  LDI r18, 254
  CMP r15, r18
  BLT r4, bp_top
  LDI r15, 254
  NEG r5

bp_top:
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r4, bp_done
  LDI r15, 0
  NEG r5

bp_done:
  POP r4
  POP r31
  RET
