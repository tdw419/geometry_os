; DESCRIPTION: Draws a orange line from (51, 30) to (503, 68).
; PLAN: r0=51(x1), r1=30(y1), r2=503(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 30
LDI r2, 503
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
