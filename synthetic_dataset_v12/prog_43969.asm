; DESCRIPTION: Creates a purple rectangular region at (159, 123) spanning 63 by 89 pixels.
; PLAN: r0=159(x), r1=123(y), r2=63(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 123
LDI r2, 63
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
