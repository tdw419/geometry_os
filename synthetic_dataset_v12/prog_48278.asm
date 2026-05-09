; DESCRIPTION: Composite: Places a white line segment connecting (159, 229) to (2, 182) then Places a orange dot at position (105, 202).
; PLAN: r0=159(x1), r1=229(y1), r2=2(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=202(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 229
LDI r2, 2
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 202
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
