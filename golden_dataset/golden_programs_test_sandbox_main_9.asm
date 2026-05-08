; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r8, 128
LDI r0, 128
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
  JZ r12, do_spawn

  JMP after_input

do_spawn:
  LDI r8, 128
  LDI r0, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r10, r26
  JZ r10, draw_hud

  LDI r6, 0

update_loop:
  MOV r2, r23
  MOV r3, r6
  LDI r18, 4
  MUL r3, r18
  ADD r2, r3

  LOAD r1, r2
  ADD r2, r7
  LOAD r15, r2
  ADD r2, r7
  LOAD r13, r2
  ADD r2, r7
  LOAD r11, r2

  ; Apply gravity
  PUSH r12
  LOAD r18, r24
  ADD r13, r18
  LOAD r18, r25
  ADD r11, r18
  POP r12

  ; Update position
  ADD r1, r13
  ADD r15, r11

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r2, r23
  MOV r3, r6
  LDI r18, 4
  MUL r3, r18
  ADD r2, r3

  STORE r2, r1
  ADD r2, r7
  STORE r2, r15
  ADD r2, r7
  STORE r2, r13
  ADD r2, r7
  STORE r2, r11

  ; Draw
  LDI r4, 0x00FF00
  PSET r1, r15, r4

  ADD r6, r7
  CMP r6, r10
  BLT r12, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r12
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r12, sb_done

  MOV r2, r23
  MOV r3, r18
  LDI r17, 4
  MUL r3, r17
  ADD r2, r3

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r8
  ADD r18, r17
  STORE r2, r18

  ADD r2, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r0
  ADD r18, r17
  STORE r2, r18

  ADD r2, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r2, r17

  ADD r2, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r2, r17

  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r12
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r12

  ; Right wall
  LDI r18, 254
  CMP r1, r18
  BLT r12, bp_left
  LDI r1, 254
  NEG r13

bp_left:
  MOV r18, r1
  LDI r19, 0
  CMP r18, r19
  BGE r12, bp_bottom
  LDI r1, 0
  NEG r13

bp_bottom:
  LDI r18, 254
  CMP r15, r18
  BLT r12, bp_top
  LDI r15, 254
  NEG r11

bp_top:
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r12, bp_done
  LDI r15, 0
  NEG r11

bp_done:
  POP r12
  POP r31
  RET
