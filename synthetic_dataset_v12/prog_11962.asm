; DESCRIPTION: Places a green circle of radius 39 at center (250, 112).
; PLAN: r0=250(x), r1=112(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 112
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
