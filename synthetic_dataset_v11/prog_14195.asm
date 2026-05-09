; DESCRIPTION: Composite: . Then Renders a purple line between points (233, 98) and (40, 194). Then Draws a blue circle centered at (151, 131) with radius 32.
; PLAN: r0=233(x1), r1=98(y1), r2=40(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=131(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (233, 98) and (40, 194).
; PLAN: r0=233(x1), r1=98(y1), r2=40(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 98
LDI r2, 40
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (151, 131) with radius 32.
; PLAN: r0=151(x), r1=131(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 131
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
