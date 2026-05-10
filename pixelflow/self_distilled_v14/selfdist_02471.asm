; DESCRIPTION: Renders a yellow circular shape at (275, 6) with radius 29.
; PLAN: r0=275(x), r1=6(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 6
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
