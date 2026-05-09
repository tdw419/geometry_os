; DESCRIPTION: Draws a orange line from (207, 56) to (231, 80).
; PLAN: r0=207(x1), r1=56(y1), r2=231(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 56
LDI r2, 231
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
