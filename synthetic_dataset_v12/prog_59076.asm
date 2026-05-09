; DESCRIPTION: Composite: Sets a single black pixel at (395, 226) then Renders a black line between points (200, 252) and (112, 12).
; PLAN: r0=395(x), r1=226(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=252(y1), r7=112(x2), r8=12(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 226
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 200
LDI r6, 252
LDI r7, 112
LDI r8, 12
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
