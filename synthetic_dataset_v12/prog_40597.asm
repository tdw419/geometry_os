; DESCRIPTION: Composite: Sets a single purple pixel at (147, 122) then Renders a red line between points (456, 79) and (96, 109).
; PLAN: r0=147(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=456(x1), r6=79(y1), r7=96(x2), r8=109(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 456
LDI r6, 79
LDI r7, 96
LDI r8, 109
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
