; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it performs pixel manipulation operations such as setting and writing pixels to the display. It also handles input checks through `IKEY` and conditionally calls `FRAME` based on specific key input conditions.

; drawing loop program
; initialization
  LDI r15, 1747
  LDI r3, 1882
  LDI r5, 4
main_0:
  ADD r0, r6, r13
  LDI r12, 0xD7004B
  LDI r9, 255
  LDI r3, 128
  PSETI
  LDI r12, 974
  LDI r9, 2563
  LDI r2, 128
  WPIXEL
  SHLI r6, r0, 6
  SAR r12, r3, r11
  SHLI r11, r10, 6
  CMPI r9, 107
  IKEY r12
  CMPI r12, 0xEB731E
  JNZ r12, key_1
  FRAME
  JMP main_0
