; DESCRIPTION: Places a yellow circle of radius 67 at center (433, 96).
; PLAN: r0=433(x), r1=96(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 96
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
