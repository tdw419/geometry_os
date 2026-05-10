; DESCRIPTION: Draws a purple circle centered at (218, 58) with radius 36.
; PLAN: r0=218(x), r1=58(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 58
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
