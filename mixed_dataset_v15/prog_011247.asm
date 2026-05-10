; DESCRIPTION: Draws a orange line from (503, 13) to (52, 43).
; PLAN: r0=503(x1), r1=13(y1), r2=52(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 13
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
