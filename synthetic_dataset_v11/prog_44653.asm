; DESCRIPTION: Creates a blue rectangular region at (34, 78) spanning 91 by 103 pixels.
; PLAN: r0=34(x), r1=78(y), r2=91(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 78
LDI r2, 91
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
