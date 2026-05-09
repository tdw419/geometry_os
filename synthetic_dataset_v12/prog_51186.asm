; DESCRIPTION: Draws a yellow circle centered at (364, 137) with radius 71.
; PLAN: r0=364(x), r1=137(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 137
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
