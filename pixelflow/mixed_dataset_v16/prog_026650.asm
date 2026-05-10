; DESCRIPTION: Composite: Places a red line segment connecting (267, 58) to (217, 45) then Places a black dot at position (219, 199).
; PLAN: r0=267(x1), r1=58(y1), r2=217(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 58
LDI r2, 217
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
HALT
