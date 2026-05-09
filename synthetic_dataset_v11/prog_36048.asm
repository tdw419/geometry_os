; DESCRIPTION: Draws a orange line from (97, 6) to (14, 180).
; PLAN: r0=97(x1), r1=6(y1), r2=14(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 6
LDI r2, 14
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
