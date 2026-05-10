; DESCRIPTION: Renders a yellow circular shape at (141, 72) with radius 76.
; PLAN: r0=141(x), r1=72(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 72
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
