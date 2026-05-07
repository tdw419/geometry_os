; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters an infinite loop where it shifts bits of register r14, loads constants into other registers, performs a pixel set operation (`PSETI`), updates the frame buffer (`FRAME`), and jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r27, 0x8198D3
  LDI r5, 1
  LDI r17, 0xB4ED46
main_0:
  SAR r5, r14, r1
  SHR r4, r14, r13
  LDI r5, 2622
  LDI r2, 2537
  LDI r6, 3853
  PSETI
  FRAME
  JMP main_0
