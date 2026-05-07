; DESCRIPTION: The GeOS assembly code initializes several registers to specific values and then uses the `WPIXEL` instruction to write a pixel at a defined location. After that, it fills an area starting from the origin with a width of 8 pixels using the `FILL` instruction before halting execution.

; simple draw program
; initialization
  LDI r5, 255
  LDI r9, 256
  LDI r0, 3217
  LDI r8, 32
  LDI r6, 255
  LDI r20, 2446
  LDI r6, 0x1502E4
  LDI r7, 0
  LDI r12, 2642
  WPIXEL
  LDI r0, 8
  FILL r0
  HALT
