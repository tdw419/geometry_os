; DESCRIPTION: Places a yellow circle of radius 17 at center (221, 75).
; PLAN: r0=221(x), r1=75(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 75
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
