; DESCRIPTION: Places a red circle of radius 30 at center (153, 134).
; PLAN: r0=153(x), r1=134(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 134
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
