; DESCRIPTION: Places a yellow circle of radius 33 at center (125, 160).
; PLAN: r0=125(x), r1=160(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 160
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
