; DESCRIPTION: This GeOS assembly code initializes system state by setting specific memory locations to designated values. It then spawns a burst of entities at random positions within a defined area, updating counters and storing entity coordinates in memory. Finally, it halts execution after verifying the count of spawned entities.

; test_sandbox_spawn.asm -- Init + spawn_burst
LDI r11, 1
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
LDI r15, 128
LDI r7, 128
CALL spawn_burst

; Verify count
LOAD r8, r26

HALT

spawn_burst:
  PUSH r31
  PUSH r10
  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r10, sb_done

  MOV r12, r23
  MOV r9, r18
  LDI r17, 4
  MUL r9, r17
  ADD r12, r9

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r15
  ADD r18, r17
  STORE r12, r18

  ADD r12, r11
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r7
  ADD r18, r17
  STORE r12, r18

  ADD r12, r11
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r12, r17

  ADD r12, r11
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r12, r17

  LOAD r18, r26
  ADD r18, r11
  STORE r26, r18

  SUB r16, r11
  JNZ r16, sb_loop

sb_done:
  POP r10
  POP r31
  RET
