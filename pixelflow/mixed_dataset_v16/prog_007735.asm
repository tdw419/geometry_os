; DESCRIPTION: Renders a blue rectangular region spanning 97 by 34 at (159, 145).
; PLAN: r0=159(x), r1=145(y), r2=97(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 145
LDI r2, 97
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
