; DESCRIPTION: Renders a yellow circular shape at (135, 172) with radius 62.
; PLAN: r0=135(x), r1=172(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 172
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
