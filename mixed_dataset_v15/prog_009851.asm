; DESCRIPTION: Creates a blue rectangular region at (375, 136) spanning 78 by 34 pixels.
; PLAN: r0=375(x), r1=136(y), r2=78(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 136
LDI r2, 78
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
