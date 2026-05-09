; DESCRIPTION: Creates a blue rectangular region at (119, 3) spanning 36 by 75 pixels.
; PLAN: r0=119(x), r1=3(y), r2=36(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 3
LDI r2, 36
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
