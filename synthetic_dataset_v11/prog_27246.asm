; DESCRIPTION: Composite: . Then Renders a blue line between points (117, 159) and (182, 144). Then Renders a red disk with center (216, 81) and radius 31.
; PLAN: r0=117(x1), r1=159(y1), r2=182(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=216(x), r1=81(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (117, 159) and (182, 144).
; PLAN: r0=117(x1), r1=159(y1), r2=182(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 159
LDI r2, 182
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (216, 81) and radius 31.
; PLAN: r0=216(x), r1=81(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 81
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
