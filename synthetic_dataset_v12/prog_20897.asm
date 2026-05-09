; DESCRIPTION: Composite: Renders a white line between points (93, 249) and (200, 208) then Sets a single orange pixel at (349, 200).
; PLAN: r0=93(x1), r1=249(y1), r2=200(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=200(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 249
LDI r2, 200
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 200
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
