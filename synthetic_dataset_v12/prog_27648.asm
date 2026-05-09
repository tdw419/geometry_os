; DESCRIPTION: Places a yellow circle of radius 47 at center (185, 183).
; PLAN: r0=185(x), r1=183(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 183
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
