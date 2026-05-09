; DESCRIPTION: Places a yellow circle of radius 57 at center (375, 169).
; PLAN: r0=375(x), r1=169(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 169
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
