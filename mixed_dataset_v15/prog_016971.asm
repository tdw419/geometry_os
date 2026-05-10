; DESCRIPTION: Composite: Sets a single white pixel at (207, 58) then Places a purple line segment connecting (204, 15) to (287, 94).
; PLAN: r0=207(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=15(y1), r7=287(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 15
LDI r7, 287
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
