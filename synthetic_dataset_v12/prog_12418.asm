; DESCRIPTION: Creates a blue rectangular region at (471, 49) spanning 36 by 20 pixels.
; PLAN: r0=471(x), r1=49(y), r2=36(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 49
LDI r2, 36
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
