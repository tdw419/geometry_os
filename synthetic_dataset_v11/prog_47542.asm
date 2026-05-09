; DESCRIPTION: Composite: . Then Renders a purple line between points (151, 33) and (225, 189). Then Places a red circle of radius 59 at center (140, 176).
; PLAN: r0=151(x1), r1=33(y1), r2=225(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=176(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (151, 33) and (225, 189).
; PLAN: r0=151(x1), r1=33(y1), r2=225(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 33
LDI r2, 225
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 59 at center (140, 176).
; PLAN: r0=140(x), r1=176(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 176
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
