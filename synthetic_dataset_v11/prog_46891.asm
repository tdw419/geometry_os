; DESCRIPTION: Places a black circle of radius 53 at center (134, 95).
; PLAN: r0=134(x), r1=95(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 95
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
