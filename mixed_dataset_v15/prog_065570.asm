; DESCRIPTION: Draws a orange line from (69, 204) to (459, 75).
; PLAN: r0=69(x1), r1=204(y1), r2=459(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 204
LDI r2, 459
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
