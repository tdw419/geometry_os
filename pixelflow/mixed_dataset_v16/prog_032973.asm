; DESCRIPTION: Places a black circle of radius 69 at center (236, 138).
; PLAN: r0=236(x), r1=138(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 138
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
