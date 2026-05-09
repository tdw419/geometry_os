; DESCRIPTION: Composite: Draws a magenta line from (497, 225) to (178, 15) then Places a black dot at position (296, 60).
; PLAN: r0=497(x1), r1=225(y1), r2=178(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=60(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 497
LDI r1, 225
LDI r2, 178
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 60
LDI r7, 0x000000
PSET r5, r6, r7
HALT
