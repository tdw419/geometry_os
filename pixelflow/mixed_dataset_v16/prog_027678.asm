; DESCRIPTION: Places a red circle of radius 25 at center (183, 93).
; PLAN: r0=183(x), r1=93(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 93
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
