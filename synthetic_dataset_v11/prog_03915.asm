; DESCRIPTION: Renders a black disk with center (167, 60) and radius 59.
; PLAN: r0=167(x), r1=60(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 60
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
