; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and enters a loop where it draws text "HELLO" on the screen, draws a line, performs bit shifting operations, and writes pixels based on certain conditions. The loop continues indefinitely, refreshing the frame.

; drawing loop program
; initialization
  LDI r21, 2227
  LDI r13, 0xC93843
  LDI r5, 0x1CA6EE
  LDI r7, 762
; palette
  LDI r0, 0x5051
  LDI r6, 1
  LDI r9, 0x00AAFF
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0x444444
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0x444444
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0xFFFF00
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0x00AAFF
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0xFF8800
  STORE r0, r9
  ADD r0, r0, r6
  LDI r9, 0x0000FF
  STORE r0, r9
  ADD r0, r0, r6
main_0:
  LDI r12, 3839
  LDI r8, 0x351ADC
  LDI r2, 64
  TEXT r12, r8, r2, "HELLO"
  LDI r8, 0
  LDI r8, 0x16439B
  LDI r4, 2416
  LDI r4, 1
  LDI r0, 2895
  LINE r8, r8, r4, r4, r0
  SHR r3, r0, r8
  SHLI r2, r4, 128
  AND r1, r7, r13
  LDI r4, 32
  LDI r8, 128
  LDI r13, 32
  WPIXEL
  CMPI r7, r31, 80
  FRAME
  JMP main_0
