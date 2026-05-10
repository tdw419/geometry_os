; DESCRIPTION: Renders a yellow circular shape at (88, 109) with radius 74.
; PLAN: r0=88(x), r1=109(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 109
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
