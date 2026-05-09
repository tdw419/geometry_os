; DESCRIPTION: Creates a green rectangular region at (122, 37) spanning 109 by 89 pixels.
; PLAN: r0=122(x), r1=37(y), r2=109(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 37
LDI r2, 109
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
