; DESCRIPTION: Creates a green rectangular region at (395, 35) spanning 66 by 36 pixels.
; PLAN: r0=395(x), r1=35(y), r2=66(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 35
LDI r2, 66
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
