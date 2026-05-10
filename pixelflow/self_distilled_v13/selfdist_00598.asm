; DESCRIPTION: Renders a yellow circular shape at (115, 54) with radius 48.
; PLAN: r0=115(x), r1=54(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 54
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
