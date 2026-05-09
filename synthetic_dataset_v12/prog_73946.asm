; DESCRIPTION: Renders a black disk with center (383, 131) and radius 24.
; PLAN: r0=383(x), r1=131(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 131
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
