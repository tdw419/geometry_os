; DESCRIPTION: Composite: . Then Renders a purple line between points (15, 199) and (111, 115). Then Places a cyan circle of radius 36 at center (158, 80).
; PLAN: r0=15(x1), r1=199(y1), r2=111(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=158(x), r1=80(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (15, 199) and (111, 115).
; PLAN: r0=15(x1), r1=199(y1), r2=111(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 199
LDI r2, 111
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 36 at center (158, 80).
; PLAN: r0=158(x), r1=80(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 80
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
