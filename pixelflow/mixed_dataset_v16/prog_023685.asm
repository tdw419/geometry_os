; DESCRIPTION: Creates a green rectangular region at (38, 199) spanning 54 by 35 pixels.
; PLAN: r0=38(x), r1=199(y), r2=54(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 199
LDI r2, 54
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
