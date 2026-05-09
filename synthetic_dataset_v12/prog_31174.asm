; DESCRIPTION: Draws a orange line from (345, 141) to (117, 63).
; PLAN: r0=345(x1), r1=141(y1), r2=117(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 141
LDI r2, 117
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
