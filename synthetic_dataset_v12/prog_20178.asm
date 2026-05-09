; DESCRIPTION: Creates a blue rectangular region at (341, 106) spanning 26 by 89 pixels.
; PLAN: r0=341(x), r1=106(y), r2=26(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 106
LDI r2, 26
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
