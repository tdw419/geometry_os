; DESCRIPTION: Renders a black disk with center (156, 162) and radius 60.
; PLAN: r0=156(x), r1=162(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 162
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
