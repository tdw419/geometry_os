; DESCRIPTION: Composite: Sets a single blue pixel at (427, 11) then Places a white line segment connecting (227, 175) to (54, 194).
; PLAN: r0=427(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=227(x1), r6=175(y1), r7=54(x2), r8=194(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 175
LDI r7, 54
LDI r8, 194
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
