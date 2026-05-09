; DESCRIPTION: Places a yellow circle of radius 76 at center (103, 152).
; PLAN: r0=103(x), r1=152(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 152
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
