; DESCRIPTION: Draws a orange line from (429, 186) to (508, 80).
; PLAN: r0=429(x1), r1=186(y1), r2=508(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 186
LDI r2, 508
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
