; DESCRIPTION: Renders a yellow disk with center (329, 233) and radius 15.
; PLAN: r0=329(x), r1=233(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 233
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
