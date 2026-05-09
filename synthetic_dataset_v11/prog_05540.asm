; DESCRIPTION: Renders a black disk with center (170, 68) and radius 57.
; PLAN: r0=170(x), r1=68(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 68
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
