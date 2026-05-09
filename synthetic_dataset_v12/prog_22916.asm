; DESCRIPTION: Renders a black disk with center (327, 178) and radius 61.
; PLAN: r0=327(x), r1=178(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 178
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
