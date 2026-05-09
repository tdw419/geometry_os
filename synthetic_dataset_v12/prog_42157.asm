; DESCRIPTION: Composite: Places a white line segment connecting (423, 75) to (458, 195) then Places a yellow dot at position (137, 2).
; PLAN: r0=423(x1), r1=75(y1), r2=458(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=2(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 75
LDI r2, 458
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 2
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
