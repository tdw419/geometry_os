; DESCRIPTION: Creates a blue rectangular region at (53, 88) spanning 84 by 57 pixels.
; PLAN: r0=53(x), r1=88(y), r2=84(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 88
LDI r2, 84
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
