; DESCRIPTION: Composite: Draws a magenta line from (315, 45) to (297, 19) then Places a red dot at position (122, 104).
; PLAN: r0=315(x1), r1=45(y1), r2=297(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 45
LDI r2, 297
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
