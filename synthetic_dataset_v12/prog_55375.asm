; DESCRIPTION: Creates a green rectangular region at (270, 138) spanning 49 by 89 pixels.
; PLAN: r0=270(x), r1=138(y), r2=49(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 138
LDI r2, 49
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
