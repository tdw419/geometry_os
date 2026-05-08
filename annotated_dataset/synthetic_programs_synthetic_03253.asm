; DESCRIPTION: The GeOS assembly code initializes several registers with specific values, sets up a color palette, and enters a drawing loop where it waits for a key press. Upon detecting the key press (specifically when the value in `r11` equals 128), it performs a series of bit shifting operations on various registers and compares them, before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r9, 3817
  LDI r1, 1
  LDI r5, 4
  LDI r29, 1521
  LDI r3, 0xCC00DC
  LDI r2, 0x3BC2E7
; palette
  LDI r0, 0x222C
  LDI r9, 1
  LDI r12, 0xFF8800
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0x550077
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0x8800FF
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0xFFEE00
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0x00FFFF
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0xFF8800
  STORE r0, r12
  ADD r0, r0, r9
  LDI r12, 0xFF00FF
  STORE r0, r12
  ADD r0, r0, r9
main_0:
  IKEY r11
  CMPI r11, 128
  JNZ r11, key_1
  SHL r4, r6, r0
  SAR r0, r7, r10
  SHL r15, r5, r9
  CMP r4, r6
  CMPI r8, 0xFF7E77
  CMPI r4, r12, 32
  SUBI r14, r21, 0xD3C52E
  FRAME
  JMP main_0
