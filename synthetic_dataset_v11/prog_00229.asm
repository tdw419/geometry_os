; DESCRIPTION: Draws a orange line from (79, 205) to (219, 100).
; PLAN: r0=79(x1), r1=205(y1), r2=219(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 205
LDI r2, 219
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
