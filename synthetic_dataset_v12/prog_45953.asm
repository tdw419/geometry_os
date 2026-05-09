; DESCRIPTION: Composite: Sets a single purple pixel at (343, 17) then Renders a red line between points (227, 122) and (368, 152).
; PLAN: r0=343(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=227(x1), r6=122(y1), r7=368(x2), r8=152(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 122
LDI r7, 368
LDI r8, 152
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
