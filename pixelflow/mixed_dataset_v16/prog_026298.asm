; DESCRIPTION: Renders a yellow circular shape at (142, 37) with radius 44.
; PLAN: r0=142(x), r1=37(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 37
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
