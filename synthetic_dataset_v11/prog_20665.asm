; DESCRIPTION: Composite: . Then Places a black line segment connecting (217, 211) to (67, 72). Then Places a red circle of radius 79 at center (159, 139).
; PLAN: r0=217(x1), r1=211(y1), r2=67(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=139(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (217, 211) to (67, 72).
; PLAN: r0=217(x1), r1=211(y1), r2=67(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 211
LDI r2, 67
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 79 at center (159, 139).
; PLAN: r0=159(x), r1=139(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 139
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
