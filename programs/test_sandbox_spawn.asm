; test_sandbox_spawn.asm -- Init + spawn_burst
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
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Spawn burst
LDI r10, 128
LDI r11, 128
CALL spawn_burst

; Verify count
LOAD r1, r26

HALT

spawn_burst:
  PUSH r31
  PUSH r0
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r0, sb_done

  MOV r14, r23
  MOV r15, r18
  LDI r17, 4
  MUL r15, r17
  ADD r14, r15

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r14, r18

  ADD r14, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r11
  ADD r18, r17
  STORE r14, r18

  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r0
  POP r31
  RET
