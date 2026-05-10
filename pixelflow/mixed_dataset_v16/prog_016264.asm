; DESCRIPTION: Draws a orange line from (133, 91) to (23, 204).
; PLAN: r0=133(x1), r1=91(y1), r2=23(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 91
LDI r2, 23
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
