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
LDI r6, 128
LDI r1, 128
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
  JZ r3, do_spawn

  JMP after_input

do_spawn:
  LDI r6, 128
  LDI r1, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r5, r26
  JZ r5, draw_hud

  LDI r9, 0

update_loop:
  MOV r14, r23
  MOV r10, r9
  LDI r18, 4
  MUL r10, r18
  ADD r14, r10

  LOAD r2, r14
  ADD r14, r13
  LOAD r8, r14
  ADD r14, r13
  LOAD r4, r14
  ADD r14, r13
  LOAD r15, r14

  ; Apply gravity
  PUSH r3
  LOAD r18, r24
  ADD r4, r18
  LOAD r18, r25
  ADD r15, r18
  POP r3

  ; Update position
  ADD r2, r4
  ADD r8, r15

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r14, r23
  MOV r10, r9
  LDI r18, 4
  MUL r10, r18
  ADD r14, r10

  STORE r14, r2
  ADD r14, r13
  STORE r14, r8
  ADD r14, r13
  STORE r14, r4
  ADD r14, r13
  STORE r14, r15

  ; Draw
  LDI r7, 0x00FF00
  PSET r2, r8, r7

  ADD r9, r13
  CMP r9, r5
  BLT r3, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r3
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r3, sb_done

  MOV r14, r23
  MOV r10, r18
  LDI r17, 4
  MUL r10, r17
  ADD r14, r10

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r6
  ADD r18, r17
  STORE r14, r18

  ADD r14, r13
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r1
  ADD r18, r17
  STORE r14, r18

  ADD r14, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ADD r14, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  LOAD r18, r26
  ADD r18, r13
  STORE r26, r18

  SUB r16, r13
  JNZ r16, sb_loop

sb_done:
  POP r3
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r3

  ; Right wall
  LDI r18, 254
  CMP r2, r18
  BLT r3, bp_left
  LDI r2, 254
  NEG r4

bp_left:
  MOV r18, r2
  LDI r19, 0
  CMP r18, r19
  BGE r3, bp_bottom
  LDI r2, 0
  NEG r4

bp_bottom:
  LDI r18, 254
  CMP r8, r18
  BLT r3, bp_top
  LDI r8, 254
  NEG r15

bp_top:
  MOV r18, r8
  LDI r19, 0
  CMP r18, r19
  BGE r3, bp_done
  LDI r8, 0
  NEG r15

bp_done:
  POP r3
  POP r31
  RET
