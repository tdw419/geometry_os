; DESCRIPTION: Places a red circle of radius 66 at center (125, 100).
; PLAN: r0=125(x), r1=100(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 100
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
