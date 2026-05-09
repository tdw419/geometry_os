; DESCRIPTION: Creates a blue rectangular region at (74, 6) spanning 106 by 89 pixels.
; PLAN: r0=74(x), r1=6(y), r2=106(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 6
LDI r2, 106
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
