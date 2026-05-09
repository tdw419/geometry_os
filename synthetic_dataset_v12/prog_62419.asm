; DESCRIPTION: Creates a black rectangular region at (155, 110) spanning 63 by 24 pixels.
; PLAN: r0=155(x), r1=110(y), r2=63(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 110
LDI r2, 63
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
