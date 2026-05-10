; DESCRIPTION: Draws a purple circle centered at (348, 186) with radius 55.
; PLAN: r0=348(x), r1=186(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 186
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
