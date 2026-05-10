; DESCRIPTION: Renders a yellow circular shape at (39, 11) with radius 79.
; PLAN: r0=39(x), r1=11(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 11
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
