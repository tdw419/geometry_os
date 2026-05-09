; DESCRIPTION: Draws a purple circle centered at (428, 82) with radius 51.
; PLAN: r0=428(x), r1=82(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 82
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
