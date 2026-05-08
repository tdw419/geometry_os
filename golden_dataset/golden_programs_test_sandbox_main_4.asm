; DESCRIPTION: This GeOS assembly code initializes a sandbox environment, spawns particles at the center, and enters a main loop where it updates particle positions applying gravity and boundary collision (bounce) logic. It also handles user input to spawn additional bursts of particles and draws the updated state on the screen.

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
  JZ r5, do_spawn

  JMP after_input

do_spawn:
  LDI r8, 128
  LDI r11, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r2, r26
  JZ r2, draw_hud

  LDI r14, 0

update_loop:
  MOV r1, r23
  MOV r0, r14
  LDI r18, 4
  MUL r0, r18
  ADD r1, r0

  LOAD r6, r1
  ADD r1, r7
  LOAD r10, r1
  ADD r1, r7
  LOAD r3, r1
  ADD r1, r7
  LOAD r12, r1

  ; Apply gravity
  PUSH r5
  LOAD r18, r24
  ADD r3, r18
  LOAD r18, r25
  ADD r12, r18
  POP r5

  ; Update position
  ADD r6, r3
  ADD r10, r12

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r1, r23
  MOV r0, r14
  LDI r18, 4
  MUL r0, r18
  ADD r1, r0

  STORE r1, r6
  ADD r1, r7
  STORE r1, r10
  ADD r1, r7
  STORE r1, r3
  ADD r1, r7
  STORE r1, r12

  ; Draw
  LDI r4, 0x00FF00
  PSET r6, r10, r4

  ADD r14, r7
  CMP r14, r2
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

  MOV r1, r23
  MOV r0, r18
  LDI r17, 4
  MUL r0, r17
  ADD r1, r0

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r8
  ADD r18, r17
  STORE r1, r18

  ADD r1, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r11
  ADD r18, r17
  STORE r1, r18

  ADD r1, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r1, r17

  ADD r1, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r1, r17

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
  CMP r6, r18
  BLT r5, bp_left
  LDI r6, 254
  NEG r3

bp_left:
  MOV r18, r6
  LDI r19, 0
  CMP r18, r19
  BGE r5, bp_bottom
  LDI r6, 0
  NEG r3

bp_bottom:
  LDI r18, 254
  CMP r10, r18
  BLT r5, bp_top
  LDI r10, 254
  NEG r12

bp_top:
  MOV r18, r10
  LDI r19, 0
  CMP r18, r19
  BGE r5, bp_done
  LDI r10, 0
  NEG r12

bp_done:
  POP r5
  POP r31
  RET
