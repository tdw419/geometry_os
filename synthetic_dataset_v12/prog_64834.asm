; DESCRIPTION: Composite: Sets a single white pixel at (301, 78) then Renders a purple line between points (152, 159) and (118, 54).
; PLAN: r0=301(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=159(y1), r7=118(x2), r8=54(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 159
LDI r7, 118
LDI r8, 54
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
