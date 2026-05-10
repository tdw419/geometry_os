; DESCRIPTION: Creates a green rectangular region at (402, 89) spanning 63 by 89 pixels.
; PLAN: r0=402(x), r1=89(y), r2=63(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 89
LDI r2, 63
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
