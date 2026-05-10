; DESCRIPTION: Draws a yellow circle centered at (269, 192) with radius 41.
; PLAN: r0=269(x), r1=192(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 192
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
