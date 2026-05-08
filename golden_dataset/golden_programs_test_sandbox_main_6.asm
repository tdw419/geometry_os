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
LDI r11, 128
LDI r0, 128
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
  LDI r11, 128
  LDI r0, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r8, r26
  JZ r8, draw_hud

  LDI r10, 0

update_loop:
  MOV r6, r23
  MOV r2, r10
  LDI r18, 4
  MUL r2, r18
  ADD r6, r2

  LOAD r5, r6
  ADD r6, r13
  LOAD r1, r6
  ADD r6, r13
  LOAD r3, r6
  ADD r6, r13
  LOAD r12, r6

  ; Apply gravity
  PUSH r9
  LOAD r18, r24
  ADD r3, r18
  LOAD r18, r25
  ADD r12, r18
  POP r9

  ; Update position
  ADD r5, r3
  ADD r1, r12

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r6, r23
  MOV r2, r10
  LDI r18, 4
  MUL r2, r18
  ADD r6, r2

  STORE r6, r5
  ADD r6, r13
  STORE r6, r1
  ADD r6, r13
  STORE r6, r3
  ADD r6, r13
  STORE r6, r12

  ; Draw
  LDI r4, 0x00FF00
  PSET r5, r1, r4

  ADD r10, r13
  CMP r10, r8
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

  ADD r6, r13
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r0
  ADD r18, r17
  STORE r6, r18

  ADD r6, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r6, r17

  ADD r6, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r6, r17

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
  CMP r5, r18
  BLT r9, bp_left
  LDI r5, 254
  NEG r3

bp_left:
  MOV r18, r5
  LDI r19, 0
  CMP r18, r19
  BGE r9, bp_bottom
  LDI r5, 0
  NEG r3

bp_bottom:
  LDI r18, 254
  CMP r1, r18
  BLT r9, bp_top
  LDI r1, 254
  NEG r12

bp_top:
  MOV r18, r1
  LDI r19, 0
  CMP r18, r19
  BGE r9, bp_done
  LDI r1, 0
  NEG r12

bp_done:
  POP r9
  POP r31
  RET
