; DESCRIPTION: Places a red circle of radius 43 at center (153, 179).
; PLAN: r0=153(x), r1=179(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 179
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
