; DESCRIPTION: Creates a blue rectangular region at (78, 45) spanning 57 by 88 pixels.
; PLAN: r0=78(x), r1=45(y), r2=57(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 45
LDI r2, 57
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
