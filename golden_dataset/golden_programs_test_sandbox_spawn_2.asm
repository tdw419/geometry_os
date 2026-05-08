; DESCRIPTION: Display a object using color colored at the screen.

; test_sandbox_spawn.asm -- Init + spawn_burst
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
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Spawn burst
LDI r7, 128
LDI r12, 128
CALL spawn_burst

; Verify count
LOAD r3, r26

HALT

spawn_burst:
  PUSH r31
  PUSH r1
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r1, sb_done

  MOV r0, r23
  MOV r4, r18
  LDI r17, 4
  MUL r4, r17
  ADD r0, r4

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r7
  ADD r18, r17
  STORE r0, r18

  ADD r0, r13
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r12
  ADD r18, r17
  STORE r0, r18

  ADD r0, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r0, r17

  ADD r0, r13
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r0, r17

  LOAD r18, r26
  ADD r18, r13
  STORE r26, r18

  SUB r16, r13
  JNZ r16, sb_loop

sb_done:
  POP r1
  POP r31
  RET
