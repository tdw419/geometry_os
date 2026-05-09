; DESCRIPTION: Places a red circle of radius 15 at center (74, 156).
; PLAN: r0=74(x), r1=156(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 156
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
