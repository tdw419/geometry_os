; DESCRIPTION: Composite: . Then Renders a red line between points (163, 178) and (90, 23). Then Sets a single cyan pixel at (227, 109).
; PLAN: r0=163(x1), r1=178(y1), r2=90(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=227(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (163, 178) and (90, 23).
; PLAN: r0=163(x1), r1=178(y1), r2=90(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 178
LDI r2, 90
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (227, 109).
; PLAN: r0=227(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
