; DESCRIPTION: Draws a orange line from (252, 113) to (79, 134).
; PLAN: r0=252(x1), r1=113(y1), r2=79(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 113
LDI r2, 79
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
