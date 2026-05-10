; DESCRIPTION: Places a orange circle of radius 22 at center (369, 221).
; PLAN: r0=369(x), r1=221(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 221
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
