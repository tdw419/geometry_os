; DESCRIPTION: Draws a purple circle centered at (158, 82) with radius 78.
; PLAN: r0=158(x), r1=82(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 82
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
