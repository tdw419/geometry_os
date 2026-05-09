; DESCRIPTION: Creates a green rectangular region at (78, 165) spanning 34 by 54 pixels.
; PLAN: r0=78(x), r1=165(y), r2=34(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 165
LDI r2, 34
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
