; DESCRIPTION: This GeOS assembly code performs a series of mathematical operations including initialization, arithmetic computations (addition, multiplication), bitwise operations (XOR, OR, AND, SHL, SHR, SHLI, SAR), and conditional branching (CMPI). It manipulates registers to execute complex calculations and logical operations typical in low-level programming tasks.

; math computation
; initialization
  LDI r0, 0x1AFC46
  LDI r13, 32
  ADDI r8, r2, 128
  ADDI r5, r7, 22
  XOR r11, r22, r7
  MUL r10, r11, r0
  OR r1, r4, r5
  SHL r11, r9, r14
  SHR r7, r0, r15
  SHLI r1, r0, 1
  SHL r13, r12, r2
  SAR r13, r14, r12
  SHL r15, r11, r7
  SAR r10, r11, r4
  CMPI r12, r4, 60
  OR r13, r8, r9
  AND r31, r11, r5
  AND r13, r12, r10
  SHL r12, r9, r31
  SHL r3, r11, r10
  ADDI r15, r14, 4
  ADD r9, r1, r15
  XOR r3, r15, r0
  AND r14, r10, r12
  HALT
