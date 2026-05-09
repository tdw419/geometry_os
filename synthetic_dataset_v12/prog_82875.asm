; DESCRIPTION: Draws a orange line from (129, 236) to (19, 90).
; PLAN: r0=129(x1), r1=236(y1), r2=19(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 236
LDI r2, 19
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
