; DESCRIPTION: Renders a yellow circular shape at (167, 40) with radius 65.
; PLAN: r0=167(x), r1=40(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 40
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
