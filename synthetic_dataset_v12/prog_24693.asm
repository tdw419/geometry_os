; DESCRIPTION: Draws a purple circle centered at (58, 208) with radius 38.
; PLAN: r0=58(x), r1=208(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 208
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
