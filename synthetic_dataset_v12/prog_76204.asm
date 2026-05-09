; DESCRIPTION: Composite: Places a purple line segment connecting (229, 51) to (361, 75) then Places a magenta dot at position (307, 172).
; PLAN: r0=229(x1), r1=51(y1), r2=361(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=172(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 51
LDI r2, 361
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 172
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
