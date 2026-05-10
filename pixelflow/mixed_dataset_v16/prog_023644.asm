; DESCRIPTION: Draws a purple circle centered at (269, 221) with radius 12.
; PLAN: r0=269(x), r1=221(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 221
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
