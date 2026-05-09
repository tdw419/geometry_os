; DESCRIPTION: Places a black circle of radius 66 at center (88, 152).
; PLAN: r0=88(x), r1=152(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 152
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
