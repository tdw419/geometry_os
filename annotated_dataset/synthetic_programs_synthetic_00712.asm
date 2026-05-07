; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop (`main_0`) where it compares two registers (`r1` and `r12`), shifts right another register (`r9`, `r10`), loads more values into registers, sets a pixel using `PSETI`, creates a frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r7, 0x55BDB0
  LDI r0, 3541
  LDI r2, 32
  LDI r8, 3384
  LDI r1, 0x590704
  LDI r4, 0xB6A9BF
  LDI r12, 421
  LDI r3, 1026
main_0:
  CMP r1, r12
  SHR r11, r9, r10
  LDI r8, 1
  LDI r11, 0xDF33CF
  LDI r5, 3174
  PSETI
  FRAME
  JMP main_0
