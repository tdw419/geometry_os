; DESCRIPTION: Creates a blue rectangular region at (47, 67) spanning 88 by 98 pixels.
; PLAN: r0=47(x), r1=67(y), r2=88(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 67
LDI r2, 88
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
