; DESCRIPTION: Composite: Places a purple dot at position (217, 42) then Places a white line segment connecting (157, 118) to (441, 21).
; PLAN: r0=217(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=118(y1), r7=441(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 118
LDI r7, 441
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
