; DESCRIPTION: This GeOS assembly code initializes a sandbox environment, spawns particles at the center, and enters a main loop where it updates particle positions applying gravity and boundary collision (bounce) logic. It also handles user input to spawn additional bursts of particles and draws the updated state on the screen.

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
LDI r4, 128
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
  JZ r1, do_spawn

  JMP after_input

do_spawn:
  LDI r4, 128
  LDI r10, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r9, r26
  JZ r9, draw_hud

  LDI r11, 0

update_loop:
  MOV r13, r23
  MOV r3, r11
  LDI r18, 4
  MUL r3, r18
  ADD r13, r3

  LOAD r6, r13
  ADD r13, r8
  LOAD r0, r13
  ADD r13, r8
  LOAD r12, r13
  ADD r13, r8
  LOAD r2, r13

  ; Apply gravity
  PUSH r1
  LOAD r18, r24
  ADD r12, r18
  LOAD r18, r25
  ADD r2, r18
  POP r1

  ; Update position
  ADD r6, r12
  ADD r0, r2

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r13, r23
  MOV r3, r11
  LDI r18, 4
  MUL r3, r18
  ADD r13, r3

  STORE r13, r6
  ADD r13, r8
  STORE r13, r0
  ADD r13, r8
  STORE r13, r12
  ADD r13, r8
  STORE r13, r2

  ; Draw
  LDI r5, 0x00FF00
  PSET r6, r0, r5

  ADD r11, r8
  CMP r11, r9
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

  MOV r13, r23
  MOV r3, r18
  LDI r17, 4
  MUL r3, r17
  ADD r13, r3

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r4
  ADD r18, r17
  STORE r13, r18

  ADD r13, r8
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r13, r18

  ADD r13, r8
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r13, r17

  ADD r13, r8
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r13, r17

  LOAD r18, r26
  ADD r18, r8
  STORE r26, r18

  SUB r16, r8
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
  CMP r6, r18
  BLT r1, bp_left
  LDI r6, 254
  NEG r12

bp_left:
  MOV r18, r6
  LDI r19, 0
  CMP r18, r19
  BGE r1, bp_bottom
  LDI r6, 0
  NEG r12

bp_bottom:
  LDI r18, 254
  CMP r0, r18
  BLT r1, bp_top
  LDI r0, 254
  NEG r2

bp_top:
  MOV r18, r0
  LDI r19, 0
  CMP r18, r19
  BGE r1, bp_done
  LDI r0, 0
  NEG r2

bp_done:
  POP r1
  POP r31
  RET
