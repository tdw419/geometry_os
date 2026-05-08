; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs a series of drawing operations. It first fills a rectangular area starting at address 885 with color 0x363E09, draws a line from (2925, 128) to (2732, 1861) using color 0x0CD68A, and finally plots a single pixel at coordinates (3153, 0xD6768A) with color 0x8CA72D. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r12, 32
  LDI r14, 16
  LDI r6, 10
  LDI r15, 0x363E09
  LDI r5, 2849
  LDI r13, 2707
  LDI r12, 885
  FILL r12
  LDI r2, 0x0CD68A
  LDI r10, 2925
  LDI r23, 2732
  LDI r7, 128
  LDI r9, 1861
  LINE r2, r10, r23, r7, r9
  LDI r0, 0x8CA72D
  LDI r14, 0xD6768A
  LDI r12, 3153
  WPIXEL
  HALT
