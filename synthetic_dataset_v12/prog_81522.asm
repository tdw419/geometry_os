; DESCRIPTION: Places a red circle of radius 56 at center (424, 194).
; PLAN: r0=424(x), r1=194(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 194
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
