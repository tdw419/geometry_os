; DESCRIPTION: Places a blue 75x87 rectangle at position (257, 147).
; PLAN: r0=257(x), r1=147(y), r2=75(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 147
LDI r2, 75
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
