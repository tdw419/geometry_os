; DESCRIPTION: Composite: Draws a red line from (464, 106) to (115, 182) then Sets a single purple pixel at (383, 124).
; PLAN: r0=464(x1), r1=106(y1), r2=115(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=124(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 106
LDI r2, 115
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 124
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
