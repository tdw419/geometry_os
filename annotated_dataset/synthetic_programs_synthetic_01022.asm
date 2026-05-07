; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and uses them to draw pixels on a display. It writes two pixels at predefined coordinates and colors, then sets another pixel using the `PSET` command before halting execution.

; simple draw program
; initialization
  LDI r3, 3157
  LDI r2, 0
  LDI r14, 2233
  LDI r14, 0xF74328
  LDI r5, 0x6A5509
  LDI r1, 16
  WPIXEL
  LDI r21, 1456
  LDI r28, 0x6B7609
  LDI r0, 256
  WPIXEL
  LDI r11, 32
  LDI r20, 64
  LDI r13, 0x1A10B9
  PSET r11, r20, r13
  HALT
