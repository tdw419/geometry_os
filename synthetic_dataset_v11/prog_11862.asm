; DESCRIPTION: Composite: . Then Places a red dot at position (60, 4). Then Places a red circle of radius 80 at center (122, 136).
; PLAN: r0=60(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=122(x), r1=136(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (60, 4).
; PLAN: r0=60(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 80 at center (122, 136).
; PLAN: r0=122(x), r1=136(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 136
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
