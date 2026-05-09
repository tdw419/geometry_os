; DESCRIPTION: Composite: . Then Places a cyan circle of radius 70 at center (183, 78). Then Renders a blue line between points (196, 182) and (118, 244).
; PLAN: r0=183(x), r1=78(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x1), r1=182(y1), r2=118(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 70 at center (183, 78).
; PLAN: r0=183(x), r1=78(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 78
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (196, 182) and (118, 244).
; PLAN: r0=196(x1), r1=182(y1), r2=118(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 182
LDI r2, 118
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
