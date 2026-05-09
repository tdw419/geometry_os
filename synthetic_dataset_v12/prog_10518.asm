; DESCRIPTION: Composite: Sets a single purple pixel at (194, 125) then Renders a green line between points (478, 57) and (171, 234).
; PLAN: r0=194(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=478(x1), r6=57(y1), r7=171(x2), r8=234(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 57
LDI r7, 171
LDI r8, 234
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
