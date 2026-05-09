; DESCRIPTION: Places a yellow circle of radius 38 at center (120, 53).
; PLAN: r0=120(x), r1=53(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 53
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
