; DESCRIPTION: Places a yellow circle of radius 21 at center (169, 88).
; PLAN: r0=169(x), r1=88(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 88
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
