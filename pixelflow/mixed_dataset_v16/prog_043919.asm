; DESCRIPTION: Draws a orange line from (510, 147) to (429, 196).
; PLAN: r0=510(x1), r1=147(y1), r2=429(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 147
LDI r2, 429
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
