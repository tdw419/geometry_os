; DESCRIPTION: Composite: . Then Renders a red line between points (18, 220) and (77, 212). Then Renders a purple disk with center (157, 50) and radius 18.
; PLAN: r0=18(x1), r1=220(y1), r2=77(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=157(x), r1=50(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (18, 220) and (77, 212).
; PLAN: r0=18(x1), r1=220(y1), r2=77(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 220
LDI r2, 77
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (157, 50) and radius 18.
; PLAN: r0=157(x), r1=50(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 50
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
