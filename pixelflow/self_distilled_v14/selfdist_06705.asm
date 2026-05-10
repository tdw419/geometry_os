; DESCRIPTION: Renders a yellow circular shape at (19, 65) with radius 35.
; PLAN: r0=19(x), r1=65(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 65
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
