; DESCRIPTION: Composite: Places a black dot at position (315, 56) then Places a green line segment connecting (265, 234) to (376, 122).
; PLAN: r0=315(x), r1=56(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=265(x1), r6=234(y1), r7=376(x2), r8=122(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 56
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 265
LDI r6, 234
LDI r7, 376
LDI r8, 122
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
