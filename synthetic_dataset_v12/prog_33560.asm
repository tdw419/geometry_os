; DESCRIPTION: Places a red circle of radius 65 at center (246, 131).
; PLAN: r0=246(x), r1=131(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 131
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
