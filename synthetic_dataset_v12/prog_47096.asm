; DESCRIPTION: Creates a blue rectangular region at (334, 89) spanning 54 by 84 pixels.
; PLAN: r0=334(x), r1=89(y), r2=54(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 89
LDI r2, 54
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
