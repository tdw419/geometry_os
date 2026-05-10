; DESCRIPTION: Composite: Sets a single blue pixel at (161, 113) then Places a black line segment connecting (41, 106) to (414, 190).
; PLAN: r0=161(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=41(x1), r6=106(y1), r7=414(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 106
LDI r7, 414
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
