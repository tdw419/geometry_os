; DESCRIPTION: Renders a yellow circular shape at (205, 153) with radius 18.
; PLAN: r0=205(x), r1=153(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 153
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
