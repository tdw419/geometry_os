; DESCRIPTION: Renders a yellow circular shape at (313, 24) with radius 49.
; PLAN: r0=313(x), r1=24(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 24
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
