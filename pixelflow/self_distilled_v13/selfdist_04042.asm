; DESCRIPTION: Draws a orange line from (142, 113) to (251, 68).
; PLAN: r0=142(x1), r1=113(y1), r2=251(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 113
LDI r2, 251
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
