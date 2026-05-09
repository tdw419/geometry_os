; DESCRIPTION: Composite: Places a blue dot at position (34, 112) then Places a orange line segment connecting (497, 46) to (46, 1).
; PLAN: r0=34(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=46(y1), r7=46(x2), r8=1(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 497
LDI r6, 46
LDI r7, 46
LDI r8, 1
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
