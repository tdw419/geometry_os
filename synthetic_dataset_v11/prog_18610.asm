; DESCRIPTION: Draws a orange line from (63, 13) to (37, 81).
; PLAN: r0=63(x1), r1=13(y1), r2=37(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 37
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
