; DESCRIPTION: Creates a blue rectangular region at (40, 119) spanning 81 by 49 pixels.
; PLAN: r0=40(x), r1=119(y), r2=81(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 119
LDI r2, 81
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
