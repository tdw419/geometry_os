; DESCRIPTION: Places a red circle of radius 60 at center (195, 194).
; PLAN: r0=195(x), r1=194(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 194
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
