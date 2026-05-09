; DESCRIPTION: Creates a green rectangular region at (139, 138) spanning 52 by 94 pixels.
; PLAN: r0=139(x), r1=138(y), r2=52(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 138
LDI r2, 52
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
