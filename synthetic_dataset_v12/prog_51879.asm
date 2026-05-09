; DESCRIPTION: Places a blue 115x91 rectangle at position (308, 110).
; PLAN: r0=308(x), r1=110(y), r2=115(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 110
LDI r2, 115
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
