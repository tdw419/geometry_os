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
LDI r2, 128
LDI r8, 128
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
  JZ r7, do_spawn

  JMP after_input

do_spawn:
  LDI r2, 128
  LDI r8, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r0, r26
  JZ r0, draw_hud

  LDI r10, 0

update_loop:
  MOV r3, r23
  MOV r14, r10
  LDI r18, 4
  MUL r14, r18
  ADD r3, r14

  LOAD r6, r3
  ADD r3, r13
  LOAD r5, r3
  ADD r3, r13
  LOAD r11, r3
  ADD r3, r13
  LOAD r12, r3

  ; Apply gravity
  PUSH r7
  LOAD r18, r24
  ADD r11, r18
  LOAD r18, r25
  ADD r12, r18
  POP r7

  ; Update position
  ADD r6, r11
  ADD r5, r12

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r3, r23
  MOV r14, r10
  LDI r18, 4
  MUL r14, r18
  ADD r3, r14

  STORE r3, r6
  ADD r3, r13
  STORE r3, r5
  ADD r3, r13
  STORE r3, r11
  ADD r3, r13
  STORE r3, r12

  ; Draw
  LDI r9, 0x00FF00
  PSET r6, r5, r9

  ADD r10, r13
  CMP r10, r0
  BLT r7, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r7
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r7, sb_done

  MOV r3, r23
  MOV r14, r18
  LDI r17, 4
  MUL r14, r17
  ADD r3, r14

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r2
  ADD r18, r17
  STORE r3, r18

  ADD r3, r13
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r8
  ADD r18, r17
  STORE r3, r18

  ADD r3, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r3, r17

  ADD r3, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r3, r17

  LOAD r18, r26
  ADD r18, r13
  STORE r26, r18

  SUB r16, r13
  JNZ r16, sb_loop

sb_done:
  POP r7
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r7

  ; Right wall
  LDI r18, 254
  CMP r6, r18
  BLT r7, bp_left
  LDI r6, 254
  NEG r11

bp_left:
  MOV r18, r6
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_bottom
  LDI r6, 0
  NEG r11

bp_bottom:
  LDI r18, 254
  CMP r5, r18
  BLT r7, bp_top
  LDI r5, 254
  NEG r12

bp_top:
  MOV r18, r5
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_done
  LDI r5, 0
  NEG r12

bp_done:
  POP r7
  POP r31
  RET
