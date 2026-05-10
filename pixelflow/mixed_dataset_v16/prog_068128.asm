; DESCRIPTION: Renders a yellow circular shape at (381, 52) with radius 50.
; PLAN: r0=381(x), r1=52(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 52
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
