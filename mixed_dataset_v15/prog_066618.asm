; DESCRIPTION: Draws a blue circle centered at (231, 134) with radius 71.
; PLAN: r0=231(x), r1=134(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 134
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
