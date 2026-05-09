; DESCRIPTION: Draws a orange line from (176, 155) to (220, 61).
; PLAN: r0=176(x1), r1=155(y1), r2=220(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 155
LDI r2, 220
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
