; DESCRIPTION: Composite: Sets a single white pixel at (152, 115) then Renders a purple line between points (483, 157) and (104, 118).
; PLAN: r0=152(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=157(y1), r7=104(x2), r8=118(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 483
LDI r6, 157
LDI r7, 104
LDI r8, 118
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
