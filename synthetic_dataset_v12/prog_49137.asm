; DESCRIPTION: Composite: Renders a green line between points (140, 93) and (375, 11) then Sets a single cyan pixel at (351, 32).
; PLAN: r0=140(x1), r1=93(y1), r2=375(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=32(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 93
LDI r2, 375
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 32
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
