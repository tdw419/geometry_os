; DESCRIPTION: Draws a purple circle centered at (95, 109) with radius 58.
; PLAN: r0=95(x), r1=109(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 109
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
