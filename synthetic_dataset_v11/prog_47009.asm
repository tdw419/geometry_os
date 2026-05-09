; DESCRIPTION: Places a black circle of radius 45 at center (74, 136).
; PLAN: r0=74(x), r1=136(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 136
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
