; DESCRIPTION: Renders a yellow circular shape at (306, 15) with radius 26.
; PLAN: r0=306(x), r1=15(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 15
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
