; DESCRIPTION: Composite: Renders a green line between points (55, 111) and (47, 183) then Sets a single yellow pixel at (246, 161).
; PLAN: r0=55(x1), r1=111(y1), r2=47(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 111
LDI r2, 47
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
