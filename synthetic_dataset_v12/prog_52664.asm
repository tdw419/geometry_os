; DESCRIPTION: Places a yellow circle of radius 80 at center (174, 114).
; PLAN: r0=174(x), r1=114(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 114
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
