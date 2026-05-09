; DESCRIPTION: Creates a blue rectangular region at (29, 19) spanning 14 by 62 pixels.
; PLAN: r0=29(x), r1=19(y), r2=14(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 19
LDI r2, 14
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
