; DESCRIPTION: Composite: Sets a single purple pixel at (81, 116) then Renders a orange line between points (458, 104) and (357, 182).
; PLAN: r0=81(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=458(x1), r6=104(y1), r7=357(x2), r8=182(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 458
LDI r6, 104
LDI r7, 357
LDI r8, 182
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
