; DESCRIPTION: Draws a purple circle centered at (293, 79) with radius 48.
; PLAN: r0=293(x), r1=79(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 79
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
