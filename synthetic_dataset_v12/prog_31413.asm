; DESCRIPTION: Composite: Sets a single purple pixel at (253, 199) then Draws a white line from (318, 141) to (290, 28).
; PLAN: r0=253(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=318(x1), r6=141(y1), r7=290(x2), r8=28(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 141
LDI r7, 290
LDI r8, 28
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
