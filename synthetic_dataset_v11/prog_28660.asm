; DESCRIPTION: Creates a blue rectangular region at (136, 142) spanning 78 by 36 pixels.
; PLAN: r0=136(x), r1=142(y), r2=78(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 142
LDI r2, 78
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
