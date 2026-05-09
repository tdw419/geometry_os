; DESCRIPTION: Composite: . Then Places a orange line segment connecting (16, 230) to (117, 92). Then Renders a black disk with center (163, 179) and radius 47.
; PLAN: r0=16(x1), r1=230(y1), r2=117(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=179(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (16, 230) to (117, 92).
; PLAN: r0=16(x1), r1=230(y1), r2=117(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 230
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (163, 179) and radius 47.
; PLAN: r0=163(x), r1=179(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 179
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
