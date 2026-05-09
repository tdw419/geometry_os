; DESCRIPTION: Draws a purple circle centered at (51, 174) with radius 42.
; PLAN: r0=51(x), r1=174(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 174
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
