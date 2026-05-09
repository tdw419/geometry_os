; DESCRIPTION: Composite: Sets a single purple pixel at (142, 201) then Draws a black line from (41, 165) to (114, 52).
; PLAN: r0=142(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=41(x1), r6=165(y1), r7=114(x2), r8=52(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 165
LDI r7, 114
LDI r8, 52
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
