; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses these to set pixel colors and fill a region on the screen. The program sets a pixel at coordinates (1206, 16) with color 0xB3010E and fills an area of size 4x4 pixels from that point before halting execution.

; simple draw program
; initialization
  LDI r2, 0xC4EE2C
  LDI r9, 255
  LDI r1, 0x65AF3B
  LDI r5, 256
  LDI r4, 0x44C238
  LDI r28, 0xB3010E
  LDI r1, 1206
  LDI r13, 16
  PSETI
  LDI r16, 4
  FILL r16
  HALT
