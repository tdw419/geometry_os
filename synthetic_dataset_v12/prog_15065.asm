; DESCRIPTION: Draws a yellow circle centered at (192, 177) with radius 41.
; PLAN: r0=192(x), r1=177(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 177
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
