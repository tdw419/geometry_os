; DESCRIPTION: Renders a yellow disk with center (138, 167) and radius 39.
; PLAN: r0=138(x), r1=167(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 167
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
