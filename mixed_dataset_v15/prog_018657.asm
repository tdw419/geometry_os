; DESCRIPTION: Composite: Renders a white line between points (150, 177) and (57, 101) then Sets a single orange pixel at (449, 106).
; PLAN: r0=150(x1), r1=177(y1), r2=57(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=106(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 177
LDI r2, 57
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 106
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
