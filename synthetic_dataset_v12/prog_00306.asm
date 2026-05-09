; DESCRIPTION: Places a magenta circle of radius 18 at center (372, 53).
; PLAN: r0=372(x), r1=53(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 53
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
