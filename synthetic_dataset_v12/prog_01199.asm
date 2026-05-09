; DESCRIPTION: Creates a green rectangular region at (122, 89) spanning 101 by 70 pixels.
; PLAN: r0=122(x), r1=89(y), r2=101(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 89
LDI r2, 101
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
