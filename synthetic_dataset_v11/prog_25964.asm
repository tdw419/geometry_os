; DESCRIPTION: Draws a orange line from (61, 90) to (250, 45).
; PLAN: r0=61(x1), r1=90(y1), r2=250(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 90
LDI r2, 250
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
