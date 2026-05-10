; DESCRIPTION: Draws a orange line from (353, 57) to (252, 200).
; PLAN: r0=353(x1), r1=57(y1), r2=252(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 252
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
