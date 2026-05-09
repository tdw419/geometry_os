; DESCRIPTION: Draws a orange line from (66, 63) to (39, 99).
; PLAN: r0=66(x1), r1=63(y1), r2=39(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 63
LDI r2, 39
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
