; DESCRIPTION: Composite: Draws a green line from (8, 168) to (44, 165) then Sets a single yellow pixel at (145, 56).
; PLAN: r0=8(x1), r1=168(y1), r2=44(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=56(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 168
LDI r2, 44
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 56
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
