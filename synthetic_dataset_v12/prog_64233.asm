; DESCRIPTION: Composite: Places a orange dot at position (251, 191) then Draws a red line from (436, 222) to (310, 4).
; PLAN: r0=251(x), r1=191(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=222(y1), r7=310(x2), r8=4(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 191
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 436
LDI r6, 222
LDI r7, 310
LDI r8, 4
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
