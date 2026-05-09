; DESCRIPTION: Draws a magenta line from (363, 199) to (308, 245).
; PLAN: r0=363(x1), r1=199(y1), r2=308(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 199
LDI r2, 308
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
