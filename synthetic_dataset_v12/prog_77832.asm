; DESCRIPTION: Draws a orange line from (323, 6) to (215, 84).
; PLAN: r0=323(x1), r1=6(y1), r2=215(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 6
LDI r2, 215
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
