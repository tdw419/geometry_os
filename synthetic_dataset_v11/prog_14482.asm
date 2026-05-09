; DESCRIPTION: Draws a purple circle centered at (217, 174) with radius 12.
; PLAN: r0=217(x), r1=174(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 174
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
