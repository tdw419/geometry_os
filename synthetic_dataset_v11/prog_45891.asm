; DESCRIPTION: Composite: . Then Sets a single red pixel at (5, 169). Then Renders a cyan line between points (246, 60) and (216, 129).
; PLAN: r0=5(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=246(x1), r1=60(y1), r2=216(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (5, 169).
; PLAN: r0=5(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 169
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (246, 60) and (216, 129).
; PLAN: r0=246(x1), r1=60(y1), r2=216(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 60
LDI r2, 216
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
