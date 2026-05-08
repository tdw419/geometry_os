; DESCRIPTION: Draws a colored object at the screen with fixed size.

; test_sandbox_spawn.asm -- Init + spawn_burst
LDI r0, 1
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
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Spawn burst
LDI r6, 128
LDI r1, 128
CALL spawn_burst

; Verify count
LOAD r10, r26

HALT

spawn_burst:
  PUSH r31
  PUSH r13
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r13, sb_done

  MOV r3, r23
  MOV r7, r18
  LDI r17, 4
  MUL r7, r17
  ADD r3, r7

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r6
  ADD r18, r17
  STORE r3, r18

  ADD r3, r0
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r1
  ADD r18, r17
  STORE r3, r18

  ADD r3, r0
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r3, r17

  ADD r3, r0
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r3, r17

  LOAD r18, r26
  ADD r18, r0
  STORE r26, r18

  SUB r16, r0
  JNZ r16, sb_loop

sb_done:
  POP r13
  POP r31
  RET
