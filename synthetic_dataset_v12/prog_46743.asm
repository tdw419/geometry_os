; DESCRIPTION: Creates a green rectangular region at (195, 100) spanning 63 by 105 pixels.
; PLAN: r0=195(x), r1=100(y), r2=63(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 100
LDI r2, 63
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
