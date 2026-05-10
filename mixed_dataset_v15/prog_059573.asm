; DESCRIPTION: Places a yellow circle of radius 25 at center (75, 175).
; PLAN: r0=75(x), r1=175(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 175
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
