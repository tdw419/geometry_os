; DESCRIPTION: Creates a green rectangular region at (225, 14) spanning 38 by 88 pixels.
; PLAN: r0=225(x), r1=14(y), r2=38(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 14
LDI r2, 38
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
