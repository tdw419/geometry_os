; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at a particular coordinate on the screen before halting execution. The exact coordinates and color are determined by the values loaded into the registers.

; simple draw program
; initialization
  LDI r7, 128
  LDI r14, 1908
  LDI r11, 2540
  LDI r13, 824
  LDI r12, 0x3B54BE
  LDI r0, 962
  LDI r1, 128
  LDI r15, 0x4C3701
  LDI r2, 2661
  LDI r8, 0xFF2FBF
  LDI r12, 0x929A16
  PSETI
  HALT
