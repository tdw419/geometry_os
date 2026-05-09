; DESCRIPTION: Places a black circle of radius 59 at center (377, 106).
; PLAN: r0=377(x), r1=106(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 106
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
