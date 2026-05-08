; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop (`main_0`) where it performs arithmetic operations, shifts bits, and calls a `FRAME` routine. The loop continuously manipulates register values using addition, subtraction, shift instructions, and unconditional branching.

; drawing loop program
; initialization
  LDI r13, 8
  LDI r4, 10
  LDI r10, 0x9015DE
main_0:
  ADD r7, r14, r10
  SUB r1, r3, r15
  SHLI r9, r7, 128
  SHR r6, r14, r29
  SHLI r11, r1, 3
  FRAME
  JMP main_0
