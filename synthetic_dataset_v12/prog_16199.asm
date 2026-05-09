; DESCRIPTION: Draws a blue circle centered at (51, 126) with radius 44.
; PLAN: r0=51(x), r1=126(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 126
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
