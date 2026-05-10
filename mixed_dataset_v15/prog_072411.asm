; DESCRIPTION: Renders a yellow circular shape at (323, 34) with radius 37.
; PLAN: r0=323(x), r1=34(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 34
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
