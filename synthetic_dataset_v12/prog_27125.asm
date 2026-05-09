; DESCRIPTION: Places a black circle of radius 33 at center (342, 153).
; PLAN: r0=342(x), r1=153(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 153
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
