; DESCRIPTION: Composite: Draws a magenta line from (95, 228) to (229, 251) then Places a purple dot at position (381, 85).
; PLAN: r0=95(x1), r1=228(y1), r2=229(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=85(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 228
LDI r2, 229
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 85
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
