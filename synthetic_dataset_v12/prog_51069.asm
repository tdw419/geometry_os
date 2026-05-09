; DESCRIPTION: Renders a black disk with center (103, 177) and radius 64.
; PLAN: r0=103(x), r1=177(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 177
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
