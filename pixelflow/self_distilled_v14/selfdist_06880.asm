; DESCRIPTION: Renders a purple rectangular region spanning 31 by 97 at (26, 122).
; PLAN: r0=26(x), r1=122(y), r2=31(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 122
LDI r2, 31
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
