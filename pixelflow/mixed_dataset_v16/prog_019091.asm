; DESCRIPTION: Draws a orange line from (290, 68) to (500, 19).
; PLAN: r0=290(x1), r1=68(y1), r2=500(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 68
LDI r2, 500
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
