; DESCRIPTION: Renders a yellow circular shape at (12, 124) with radius 33.
; PLAN: r0=12(x), r1=124(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 12
LDI r1, 124
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
