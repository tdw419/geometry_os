; DESCRIPTION: Renders a yellow disk with center (332, 39) and radius 10.
; PLAN: r0=332(x), r1=39(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 39
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
