; DESCRIPTION: Creates a green rectangular region at (54, 123) spanning 96 by 18 pixels.
; PLAN: r0=54(x), r1=123(y), r2=96(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 123
LDI r2, 96
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
