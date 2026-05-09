; DESCRIPTION: Places a yellow circle of radius 72 at center (74, 93).
; PLAN: r0=74(x), r1=93(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 93
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
