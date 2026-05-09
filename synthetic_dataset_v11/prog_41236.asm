; DESCRIPTION: Draws a orange line from (118, 63) to (87, 58).
; PLAN: r0=118(x1), r1=63(y1), r2=87(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 63
LDI r2, 87
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
