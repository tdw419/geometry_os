; DESCRIPTION: This GeOS assembly code initializes a sandbox environment, spawns particles at the center, and enters a main loop where it updates particle positions applying gravity and boundary collision (bounce) logic. It also handles user input to spawn additional bursts of particles and draws the updated state on the screen.

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
LDI r13, 128
LDI r15, 128
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
  JZ r2, do_spawn

  JMP after_input

do_spawn:
  LDI r13, 128
  LDI r15, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r8, r26
  JZ r8, draw_hud

  LDI r1, 0

update_loop:
  MOV r7, r23
  MOV r9, r1
  LDI r18, 4
  MUL r9, r18
  ADD r7, r9

  LOAD r14, r7
  ADD r7, r5
  LOAD r4, r7
  ADD r7, r5
  LOAD r10, r7
  ADD r7, r5
  LOAD r12, r7

  ; Apply gravity
  PUSH r2
  LOAD r18, r24
  ADD r10, r18
  LOAD r18, r25
  ADD r12, r18
  POP r2

  ; Update position
  ADD r14, r10
  ADD r4, r12

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r7, r23
  MOV r9, r1
  LDI r18, 4
  MUL r9, r18
  ADD r7, r9

  STORE r7, r14
  ADD r7, r5
  STORE r7, r4
  ADD r7, r5
  STORE r7, r10
  ADD r7, r5
  STORE r7, r12

  ; Draw
  LDI r3, 0x00FF00
  PSET r14, r4, r3

  ADD r1, r5
  CMP r1, r8
  BLT r2, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r2
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r2, sb_done

  MOV r7, r23
  MOV r9, r18
  LDI r17, 4
  MUL r9, r17
  ADD r7, r9

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r13
  ADD r18, r17
  STORE r7, r18

  ADD r7, r5
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r15
  ADD r18, r17
  STORE r7, r18

  ADD r7, r5
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r7, r17

  ADD r7, r5
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r7, r17

  LOAD r18, r26
  ADD r18, r5
  STORE r26, r18

  SUB r16, r5
  JNZ r16, sb_loop

sb_done:
  POP r2
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r2

  ; Right wall
  LDI r18, 254
  CMP r14, r18
  BLT r2, bp_left
  LDI r14, 254
  NEG r10

bp_left:
  MOV r18, r14
  LDI r19, 0
  CMP r18, r19
  BGE r2, bp_bottom
  LDI r14, 0
  NEG r10

bp_bottom:
  LDI r18, 254
  CMP r4, r18
  BLT r2, bp_top
  LDI r4, 254
  NEG r12

bp_top:
  MOV r18, r4
  LDI r19, 0
  CMP r18, r19
  BGE r2, bp_done
  LDI r4, 0
  NEG r12

bp_done:
  POP r2
  POP r31
  RET
