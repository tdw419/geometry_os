; DESCRIPTION: Places a yellow circle of radius 68 at center (369, 148).
; PLAN: r0=369(x), r1=148(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 148
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
