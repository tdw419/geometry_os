; DESCRIPTION: Places a red circle of radius 25 at center (155, 30).
; PLAN: r0=155(x), r1=30(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 30
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
