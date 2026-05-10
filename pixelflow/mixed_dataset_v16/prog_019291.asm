; DESCRIPTION: Creates a blue rectangular region at (296, 101) spanning 89 by 88 pixels.
; PLAN: r0=296(x), r1=101(y), r2=89(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 101
LDI r2, 89
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
