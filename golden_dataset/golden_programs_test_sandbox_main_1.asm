; DESCRIPTION: This GeOS assembly code initializes a sandbox environment, spawns particles at the center, and enters a main loop where it updates particle positions applying gravity and boundary collision (bounce) logic. It also handles user input to spawn additional bursts of particles and draws the updated state on the screen.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r4, 1
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
LDI r12, 128
LDI r3, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r4
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r1, do_spawn

  JMP after_input

do_spawn:
  LDI r12, 128
  LDI r3, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r6, r26
  JZ r6, draw_hud

  LDI r11, 0

update_loop:
  MOV r14, r23
  MOV r0, r11
  LDI r18, 4
  MUL r0, r18
  ADD r14, r0

  LOAD r10, r14
  ADD r14, r4
  LOAD r15, r14
  ADD r14, r4
  LOAD r7, r14
  ADD r14, r4
  LOAD r2, r14

  ; Apply gravity
  PUSH r1
  LOAD r18, r24
  ADD r7, r18
  LOAD r18, r25
  ADD r2, r18
  POP r1

  ; Update position
  ADD r10, r7
  ADD r15, r2

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r14, r23
  MOV r0, r11
  LDI r18, 4
  MUL r0, r18
  ADD r14, r0

  STORE r14, r10
  ADD r14, r4
  STORE r14, r15
  ADD r14, r4
  STORE r14, r7
  ADD r14, r4
  STORE r14, r2

  ; Draw
  LDI r13, 0x00FF00
  PSET r10, r15, r13

  ADD r11, r4
  CMP r11, r6
  BLT r1, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r1
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r1, sb_done

  MOV r14, r23
  MOV r0, r18
  LDI r17, 4
  MUL r0, r17
  ADD r14, r0

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r12
  ADD r18, r17
  STORE r14, r18

  ADD r14, r4
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r3
  ADD r18, r17
  STORE r14, r18

  ADD r14, r4
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ADD r14, r4
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  LOAD r18, r26
  ADD r18, r4
  STORE r26, r18

  SUB r16, r4
  JNZ r16, sb_loop

sb_done:
  POP r1
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r1

  ; Right wall
  LDI r18, 254
  CMP r10, r18
  BLT r1, bp_left
  LDI r10, 254
  NEG r7

bp_left:
  MOV r18, r10
  LDI r19, 0
  CMP r18, r19
  BGE r1, bp_bottom
  LDI r10, 0
  NEG r7

bp_bottom:
  LDI r18, 254
  CMP r15, r18
  BLT r1, bp_top
  LDI r15, 254
  NEG r2

bp_top:
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r1, bp_done
  LDI r15, 0
  NEG r2

bp_done:
  POP r1
  POP r31
  RET
