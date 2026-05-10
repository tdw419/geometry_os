; DESCRIPTION: Draws a magenta line from (251, 15) to (427, 247).
; PLAN: r0=251(x1), r1=15(y1), r2=427(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 15
LDI r2, 427
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
