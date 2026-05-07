; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for a key press. Upon detecting the key '4', it performs bitwise operations on the register values, draws a pixel, and fills a rectangle on the screen before updating the frame and repeating the process.

; drawing loop program
; initialization
  LDI r5, 3793
  LDI r21, 0x8FEDE1
  LDI r0, 2037
  LDI r8, 0xECAA58
  LDI r11, 0x4C3707
  LDI r7, 2270
  LDI r9, 0x6DCA1A
main_0:
  IKEY r2
  CMPI r2, 4
  JNZ r2, key_1
  SHL r9, r10, r5
  SHR r12, r7, r2
  SAR r7, r6, r8
  OR r6, r9, r13
  AND r0, r14, r7
  LDI r4, 0x52E1E4
  LDI r8, 16
  LDI r10, 32
  WPIXEL
  ANDI r8, r9, 64
  LDI r4, 3076
  LDI r10, 32
  LDI r12, 128
  LDI r5, 4026
  LDI r6, 118
  RECTF r4, r10, r12, r5, r6
  FRAME
  JMP main_0
