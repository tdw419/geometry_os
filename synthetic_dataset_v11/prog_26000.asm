; DESCRIPTION: Places a yellow circle of radius 72 at center (88, 174).
; PLAN: r0=88(x), r1=174(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 174
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
