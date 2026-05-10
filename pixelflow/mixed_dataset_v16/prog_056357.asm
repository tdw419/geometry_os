; DESCRIPTION: Renders a magenta box of size 110x75 starting at (272, 85).
; PLAN: r0=272(x), r1=85(y), r2=110(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 85
LDI r2, 110
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
