; DESCRIPTION: Composite: Places a orange line segment connecting (55, 190) to (329, 142) then Places a orange dot at position (208, 33).
; PLAN: r0=55(x1), r1=190(y1), r2=329(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=33(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 190
LDI r2, 329
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 33
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
