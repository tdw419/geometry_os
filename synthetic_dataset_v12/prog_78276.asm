; DESCRIPTION: Places a yellow circle of radius 58 at center (240, 93).
; PLAN: r0=240(x), r1=93(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 93
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
