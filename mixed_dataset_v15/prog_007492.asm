; DESCRIPTION: Draws a orange line from (383, 208) to (458, 211).
; PLAN: r0=383(x1), r1=208(y1), r2=458(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 208
LDI r2, 458
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
