; DESCRIPTION: Places a yellow circle of radius 65 at center (174, 99).
; PLAN: r0=174(x), r1=99(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 99
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
