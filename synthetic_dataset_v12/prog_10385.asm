; DESCRIPTION: Places a yellow circle of radius 65 at center (394, 119).
; PLAN: r0=394(x), r1=119(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 119
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
