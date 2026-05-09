; DESCRIPTION: Places a red circle of radius 53 at center (399, 64).
; PLAN: r0=399(x), r1=64(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 64
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
