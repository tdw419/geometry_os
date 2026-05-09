; DESCRIPTION: Draws a orange line from (231, 1) to (184, 180).
; PLAN: r0=231(x1), r1=1(y1), r2=184(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 1
LDI r2, 184
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
