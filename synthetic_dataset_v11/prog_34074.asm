; DESCRIPTION: Draws a orange line from (79, 237) to (162, 133).
; PLAN: r0=79(x1), r1=237(y1), r2=162(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 237
LDI r2, 162
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
