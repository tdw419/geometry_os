; DESCRIPTION: Draws a purple circle centered at (208, 215) with radius 25.
; PLAN: r0=208(x), r1=215(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 215
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
