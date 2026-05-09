; DESCRIPTION: Renders a yellow disk with center (81, 103) and radius 31.
; PLAN: r0=81(x), r1=103(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 103
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
