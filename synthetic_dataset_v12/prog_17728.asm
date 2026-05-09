; DESCRIPTION: Places a red circle of radius 73 at center (84, 97).
; PLAN: r0=84(x), r1=97(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 97
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
