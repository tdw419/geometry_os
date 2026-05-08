; DESCRIPTION: This GeOS assembly code initializes system state by setting specific memory locations to designated values. It then spawns a burst of entities at random positions within a defined area, updating counters and storing entity coordinates in memory. Finally, it halts execution after verifying the count of spawned entities.

; test_sandbox_spawn.asm -- Init + spawn_burst
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
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Spawn burst
LDI r5, 128
LDI r8, 128
CALL spawn_burst

; Verify count
LOAD r15, r26

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

  MOV r3, r23
  MOV r0, r18
  LDI r17, 4
  MUL r0, r17
  ADD r3, r0

  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r5
  ADD r18, r17
  STORE r3, r18

  ADD r3, r4
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r8
  ADD r18, r17
  STORE r3, r18

  ADD r3, r4
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r3, r17

  ADD r3, r4
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r3, r17

  LOAD r18, r26
  ADD r18, r4
  STORE r26, r18

  SUB r16, r4
  JNZ r16, sb_loop

sb_done:
  POP r1
  POP r31
  RET
