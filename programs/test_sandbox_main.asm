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
LDI r10, 128
LDI r11, 128
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
  JZ r0, do_spawn

  JMP after_input

do_spawn:
  LDI r10, 128
  LDI r11, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r12, r26
  JZ r12, draw_hud

  LDI r13, 0

update_loop:
  MOV r14, r23
  MOV r15, r13
  LDI r18, 4
  MUL r15, r18
  ADD r14, r15

  LOAD r1, r14
  ADD r14, r7
  LOAD r2, r14
  ADD r14, r7
  LOAD r3, r14
  ADD r14, r7
  LOAD r4, r14

  ; Apply gravity
  PUSH r0
  LOAD r18, r24
  ADD r3, r18
  LOAD r18, r25
  ADD r4, r18
  POP r0

  ; Update position
  ADD r1, r3
  ADD r2, r4

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r14, r23
  MOV r15, r13
  LDI r18, 4
  MUL r15, r18
  ADD r14, r15

  STORE r14, r1
  ADD r14, r7
  STORE r14, r2
  ADD r14, r7
  STORE r14, r3
  ADD r14, r7
  STORE r14, r4

  ; Draw
  LDI r6, 0x00FF00
  PSET r1, r2, r6

  ADD r13, r7
  CMP r13, r12
  BLT r0, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r0
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r0, sb_done

  MOV r14, r23
  MOV r15, r18
  LDI r17, 4
  MUL r15, r17
  ADD r14, r15

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r14, r18

  ADD r14, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r11
  ADD r18, r17
  STORE r14, r18

  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r0
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r0

  ; Right wall
  LDI r18, 254
  CMP r1, r18
  BLT r0, bp_left
  LDI r1, 254
  NEG r3

bp_left:
  MOV r18, r1
  LDI r19, 0
  CMP r18, r19
  BGE r0, bp_bottom
  LDI r1, 0
  NEG r3

bp_bottom:
  LDI r18, 254
  CMP r2, r18
  BLT r0, bp_top
  LDI r2, 254
  NEG r4

bp_top:
  MOV r18, r2
  LDI r19, 0
  CMP r18, r19
  BGE r0, bp_done
  LDI r2, 0
  NEG r4

bp_done:
  POP r0
  POP r31
  RET
