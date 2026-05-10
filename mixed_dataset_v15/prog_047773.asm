; DESCRIPTION: Renders a yellow circular shape at (138, 95) with radius 44.
; PLAN: r0=138(x), r1=95(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 95
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
