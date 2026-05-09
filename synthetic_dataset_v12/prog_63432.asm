; DESCRIPTION: Composite: Places a black dot at position (458, 145) then Places a orange line segment connecting (310, 187) to (125, 233).
; PLAN: r0=458(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=187(y1), r7=125(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 187
LDI r7, 125
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
