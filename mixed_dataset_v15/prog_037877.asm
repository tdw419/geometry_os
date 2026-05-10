; DESCRIPTION: Places a yellow circle of radius 47 at center (369, 88).
; PLAN: r0=369(x), r1=88(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 88
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
