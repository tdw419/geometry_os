; DESCRIPTION: This GeOS assembly code initializes a sandbox environment, spawns particles at the center, and enters a main loop where it updates particle positions applying gravity and boundary collision (bounce) logic. It also handles user input to spawn additional bursts of particles and draws the updated state on the screen.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r13, 1
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
LDI r10, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r13
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r9, do_spawn

  JMP after_input

do_spawn:
  LDI r14, 128
  LDI r10, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r4, r26
  JZ r4, draw_hud

  LDI r6, 0

update_loop:
  MOV r12, r23
  MOV r8, r6
  LDI r18, 4
  MUL r8, r18
  ADD r12, r8

  LOAD r1, r12
  ADD r12, r13
  LOAD r7, r12
  ADD r12, r13
  LOAD r2, r12
  ADD r12, r13
  LOAD r15, r12

  ; Apply gravity
  PUSH r9
  LOAD r18, r24
  ADD r2, r18
  LOAD r18, r25
  ADD r15, r18
  POP r9

  ; Update position
  ADD r1, r2
  ADD r7, r15

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r12, r23
  MOV r8, r6
  LDI r18, 4
  MUL r8, r18
  ADD r12, r8

  STORE r12, r1
  ADD r12, r13
  STORE r12, r7
  ADD r12, r13
  STORE r12, r2
  ADD r12, r13
  STORE r12, r15

  ; Draw
  LDI r0, 0x00FF00
  PSET r1, r7, r0

  ADD r6, r13
  CMP r6, r4
  BLT r9, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r9
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r9, sb_done

  MOV r12, r23
  MOV r8, r18
  LDI r17, 4
  MUL r8, r17
  ADD r12, r8

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r14
  ADD r18, r17
  STORE r12, r18

  ADD r12, r13
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r12, r18

  ADD r12, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r12, r17

  ADD r12, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r12, r17

  LOAD r18, r26
  ADD r18, r13
  STORE r26, r18

  SUB r16, r13
  JNZ r16, sb_loop

sb_done:
  POP r9
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r9

  ; Right wall
  LDI r18, 254
  CMP r1, r18
  BLT r9, bp_left
  LDI r1, 254
  NEG r2

bp_left:
  MOV r18, r1
  LDI r19, 0
  CMP r18, r19
  BGE r9, bp_bottom
  LDI r1, 0
  NEG r2

bp_bottom:
  LDI r18, 254
  CMP r7, r18
  BLT r9, bp_top
  LDI r7, 254
  NEG r15

bp_top:
  MOV r18, r7
  LDI r19, 0
  CMP r18, r19
  BGE r9, bp_done
  LDI r7, 0
  NEG r15

bp_done:
  POP r9
  POP r31
  RET
