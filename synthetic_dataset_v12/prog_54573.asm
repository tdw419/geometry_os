; DESCRIPTION: Creates a blue rectangular region at (155, 94) spanning 110 by 85 pixels.
; PLAN: r0=155(x), r1=94(y), r2=110(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 94
LDI r2, 110
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
