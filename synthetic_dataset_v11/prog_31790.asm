; DESCRIPTION: Draws a orange line from (221, 233) to (99, 87).
; PLAN: r0=221(x1), r1=233(y1), r2=99(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 233
LDI r2, 99
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
