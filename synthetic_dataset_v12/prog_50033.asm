; DESCRIPTION: Places a yellow circle of radius 79 at center (423, 88).
; PLAN: r0=423(x), r1=88(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 88
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
