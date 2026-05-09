; DESCRIPTION: Draws a orange line from (234, 212) to (112, 90).
; PLAN: r0=234(x1), r1=212(y1), r2=112(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 212
LDI r2, 112
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
