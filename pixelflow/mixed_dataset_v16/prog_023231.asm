; DESCRIPTION: Composite: Draws a magenta line from (263, 134) to (424, 37) then Sets a single magenta pixel at (83, 200).
; PLAN: r0=263(x1), r1=134(y1), r2=424(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 134
LDI r2, 424
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
