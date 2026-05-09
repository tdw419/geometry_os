; DESCRIPTION: Draws a magenta line from (266, 76) to (323, 202).
; PLAN: r0=266(x1), r1=76(y1), r2=323(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 76
LDI r2, 323
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
