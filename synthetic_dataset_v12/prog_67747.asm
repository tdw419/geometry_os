; DESCRIPTION: Draws a orange line from (429, 36) to (180, 106).
; PLAN: r0=429(x1), r1=36(y1), r2=180(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 36
LDI r2, 180
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
