; DESCRIPTION: Places a yellow circle of radius 57 at center (151, 65).
; PLAN: r0=151(x), r1=65(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 65
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
