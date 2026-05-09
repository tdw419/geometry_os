; DESCRIPTION: Creates a blue rectangular region at (37, 78) spanning 36 by 53 pixels.
; PLAN: r0=37(x), r1=78(y), r2=36(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 36
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
