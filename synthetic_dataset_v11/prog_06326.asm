; DESCRIPTION: Creates a green rectangular region at (34, 181) spanning 81 by 35 pixels.
; PLAN: r0=34(x), r1=181(y), r2=81(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 181
LDI r2, 81
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
