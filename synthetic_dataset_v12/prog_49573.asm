; DESCRIPTION: Creates a blue rectangular region at (32, 94) spanning 88 by 118 pixels.
; PLAN: r0=32(x), r1=94(y), r2=88(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 94
LDI r2, 88
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
