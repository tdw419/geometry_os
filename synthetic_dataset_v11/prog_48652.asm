; DESCRIPTION: Places a purple circle of radius 22 at center (174, 75).
; PLAN: r0=174(x), r1=75(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 75
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
