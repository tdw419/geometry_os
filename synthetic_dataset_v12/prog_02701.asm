; DESCRIPTION: Places a yellow circle of radius 76 at center (151, 132).
; PLAN: r0=151(x), r1=132(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 132
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
