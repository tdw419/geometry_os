; DESCRIPTION: Renders a yellow circular shape at (292, 22) with radius 28.
; PLAN: r0=292(x), r1=22(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 22
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
