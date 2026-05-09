; DESCRIPTION: Draws a purple circle centered at (248, 83) with radius 77.
; PLAN: r0=248(x), r1=83(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 83
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
