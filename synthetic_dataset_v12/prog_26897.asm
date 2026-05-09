; DESCRIPTION: Creates a blue rectangular region at (302, 89) spanning 25 by 97 pixels.
; PLAN: r0=302(x), r1=89(y), r2=25(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 89
LDI r2, 25
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
