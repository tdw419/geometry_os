; DESCRIPTION: Renders a yellow circular shape at (83, 156) with radius 16.
; PLAN: r0=83(x), r1=156(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 156
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
