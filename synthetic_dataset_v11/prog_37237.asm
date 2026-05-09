; DESCRIPTION: Composite: . Then Places a blue dot at position (220, 173). Then Renders a red line between points (118, 182) and (134, 39).
; PLAN: r0=220(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=118(x1), r1=182(y1), r2=134(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (220, 173).
; PLAN: r0=220(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (118, 182) and (134, 39).
; PLAN: r0=118(x1), r1=182(y1), r2=134(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 182
LDI r2, 134
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
