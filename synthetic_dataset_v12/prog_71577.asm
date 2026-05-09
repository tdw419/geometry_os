; DESCRIPTION: Draws a orange line from (79, 19) to (86, 188).
; PLAN: r0=79(x1), r1=19(y1), r2=86(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 19
LDI r2, 86
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
