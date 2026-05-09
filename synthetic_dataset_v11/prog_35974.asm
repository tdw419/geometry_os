; DESCRIPTION: Places a black circle of radius 39 at center (55, 88).
; PLAN: r0=55(x), r1=88(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 88
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
