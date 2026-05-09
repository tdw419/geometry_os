; DESCRIPTION: Composite: Places a black line segment connecting (316, 108) to (311, 138) then Sets a single black pixel at (333, 172).
; PLAN: r0=316(x1), r1=108(y1), r2=311(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=172(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 108
LDI r2, 311
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 172
LDI r7, 0x000000
PSET r5, r6, r7
HALT
