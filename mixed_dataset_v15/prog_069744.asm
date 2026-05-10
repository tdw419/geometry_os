; DESCRIPTION: Places a black 20x79 rectangle at position (62, 145).
; PLAN: r0=62(x), r1=145(y), r2=20(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 145
LDI r2, 20
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
