; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; test_sandbox_main.asm -- Init + spawn + main loop
LDI r15, 1
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
LDI r14, 128
CALL spawn_burst

; ===== Main Loop =====
main_loop:
  LOAD r18, r27
  ADD r18, r15
  STORE r27, r18

  IKEY r19

  ; Space = spawn
  LDI r18, 32
  CMP r19, r18
  JZ r6, do_spawn

  JMP after_input

do_spawn:
  LDI r4, 128
  LDI r14, 128
  CALL spawn_burst
  JMP after_input

after_input:
  LOAD r2, r26
  JZ r2, draw_hud

  LDI r3, 0

update_loop:
  MOV r0, r23
  MOV r1, r3
  LDI r18, 4
  MUL r1, r18
  ADD r0, r1

  LOAD r5, r0
  ADD r0, r15
  LOAD r8, r0
  ADD r0, r15
  LOAD r9, r0
  ADD r0, r15
  LOAD r12, r0

  ; Apply gravity
  PUSH r6
  LOAD r18, r24
  ADD r9, r18
  LOAD r18, r25
  ADD r12, r18
  POP r6

  ; Update position
  ADD r5, r9
  ADD r8, r12

  ; Bounce
  CALL bounce_particle

  ; Store
  MOV r0, r23
  MOV r1, r3
  LDI r18, 4
  MUL r1, r18
  ADD r0, r1

  STORE r0, r5
  ADD r0, r15
  STORE r0, r8
  ADD r0, r15
  STORE r0, r9
  ADD r0, r15
  STORE r0, r12

  ; Draw
  LDI r10, 0x00FF00
  PSET r5, r8, r10

  ADD r3, r15
  CMP r3, r2
  BLT r6, update_loop

draw_hud:
  FRAME
  JMP main_loop

HALT

; ===== Subroutines =====
spawn_burst:
  PUSH r31
  PUSH r6
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r6, sb_done

  MOV r0, r23
  MOV r1, r18
  LDI r17, 4
  MUL r1, r17
  ADD r0, r1

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r4
  ADD r18, r17
  STORE r0, r18

  ADD r0, r15
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r14
  ADD r18, r17
  STORE r0, r18

  ADD r0, r15
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r0, r17

  ADD r0, r15
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r0, r17

  LOAD r18, r26
  ADD r18, r15
  STORE r26, r18

  SUB r16, r15
  JNZ r16, sb_loop

sb_done:
  POP r6
  POP r31
  RET

bounce_particle:
  PUSH r31
  PUSH r6

  ; Right wall
  LDI r18, 254
  CMP r5, r18
  BLT r6, bp_left
  LDI r5, 254
  NEG r9

bp_left:
  MOV r18, r5
  LDI r19, 0
  CMP r18, r19
  BGE r6, bp_bottom
  LDI r5, 0
  NEG r9

bp_bottom:
  LDI r18, 254
  CMP r8, r18
  BLT r6, bp_top
  LDI r8, 254
  NEG r12

bp_top:
  MOV r18, r8
  LDI r19, 0
  CMP r18, r19
  BGE r6, bp_done
  LDI r8, 0
  NEG r12

bp_done:
  POP r6
  POP r31
  RET
