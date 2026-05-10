; DESCRIPTION: Places a red circle of radius 75 at center (246, 177).
; PLAN: r0=246(x), r1=177(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 177
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
