; DESCRIPTION: Places a red circle of radius 18 at center (177, 84).
; PLAN: r0=177(x), r1=84(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 84
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
