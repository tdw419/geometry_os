; DESCRIPTION: Draws a orange line from (123, 212) to (185, 39).
; PLAN: r0=123(x1), r1=212(y1), r2=185(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 212
LDI r2, 185
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
