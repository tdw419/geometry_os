; DESCRIPTION: Places a red circle of radius 76 at center (246, 157).
; PLAN: r0=246(x), r1=157(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 157
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
