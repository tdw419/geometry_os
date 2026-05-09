; DESCRIPTION: Draws a purple circle centered at (126, 96) with radius 66.
; PLAN: r0=126(x), r1=96(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 96
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
