; DESCRIPTION: Composite: Places a orange line segment connecting (462, 109) to (500, 50) then Places a red dot at position (107, 39).
; PLAN: r0=462(x1), r1=109(y1), r2=500(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 109
LDI r2, 500
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
