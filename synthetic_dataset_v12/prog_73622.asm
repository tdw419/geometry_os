; DESCRIPTION: Creates a blue rectangular region at (396, 40) spanning 89 by 81 pixels.
; PLAN: r0=396(x), r1=40(y), r2=89(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 40
LDI r2, 89
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
