; DESCRIPTION: Places a yellow circle of radius 32 at center (424, 88).
; PLAN: r0=424(x), r1=88(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 88
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
