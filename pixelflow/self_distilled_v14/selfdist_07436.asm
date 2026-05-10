; DESCRIPTION: Renders a yellow circular shape at (361, 97) with radius 71.
; PLAN: r0=361(x), r1=97(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 97
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
