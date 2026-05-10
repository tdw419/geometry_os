; DESCRIPTION: Places a yellow circle of radius 48 at center (90, 92).
; PLAN: r0=90(x), r1=92(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 92
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
