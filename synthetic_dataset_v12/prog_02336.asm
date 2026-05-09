; DESCRIPTION: Places a yellow circle of radius 47 at center (308, 72).
; PLAN: r0=308(x), r1=72(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 72
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
