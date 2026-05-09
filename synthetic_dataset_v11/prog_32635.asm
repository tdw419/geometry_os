; DESCRIPTION: Draws a purple circle centered at (91, 74) with radius 71.
; PLAN: r0=91(x), r1=74(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 74
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
