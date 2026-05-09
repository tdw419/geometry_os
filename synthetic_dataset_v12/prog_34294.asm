; DESCRIPTION: Composite: Sets a single red pixel at (298, 26) then Places a orange line segment connecting (303, 206) to (298, 0).
; PLAN: r0=298(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=303(x1), r6=206(y1), r7=298(x2), r8=0(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 303
LDI r6, 206
LDI r7, 298
LDI r8, 0
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
