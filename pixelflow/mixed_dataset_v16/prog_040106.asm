; DESCRIPTION: Places a yellow circle of radius 28 at center (98, 133).
; PLAN: r0=98(x), r1=133(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 133
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
