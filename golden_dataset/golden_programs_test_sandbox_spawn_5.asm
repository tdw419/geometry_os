; DESCRIPTION: Render a colored object at the screen.

; test_sandbox_spawn.asm -- Init + spawn_burst
LDI r10, 1
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
LDI r14, 128
LDI r5, 128
CALL spawn_burst

; Verify count
LOAD r13, r26

HALT

spawn_burst:
  PUSH r31
  PUSH r11
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r11, sb_done

  MOV r8, r23
  MOV r6, r18
  LDI r17, 4
  MUL r6, r17
  ADD r8, r6

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r14
  ADD r18, r17
  STORE r8, r18

  ADD r8, r10
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r5
  ADD r18, r17
  STORE r8, r18

  ADD r8, r10
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r8, r17

  ADD r8, r10
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r8, r17

  LOAD r18, r26
  ADD r18, r10
  STORE r26, r18

  SUB r16, r10
  JNZ r16, sb_loop

sb_done:
  POP r11
  POP r31
  RET
