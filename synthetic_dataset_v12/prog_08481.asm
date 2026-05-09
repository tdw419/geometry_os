; DESCRIPTION: Draws a orange line from (351, 162) to (299, 180).
; PLAN: r0=351(x1), r1=162(y1), r2=299(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 162
LDI r2, 299
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
