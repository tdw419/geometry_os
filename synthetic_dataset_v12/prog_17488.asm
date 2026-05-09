; DESCRIPTION: Places a blue 91x83 rectangle at position (343, 110).
; PLAN: r0=343(x), r1=110(y), r2=91(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 110
LDI r2, 91
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
