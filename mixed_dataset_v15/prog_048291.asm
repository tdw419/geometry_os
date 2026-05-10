; DESCRIPTION: Renders a yellow circular shape at (157, 43) with radius 45.
; PLAN: r0=157(x), r1=43(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 43
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
