; DESCRIPTION: Places a orange line segment connecting (253, 41) to (500, 65).
; PLAN: r0=253(x1), r1=41(y1), r2=500(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 41
LDI r2, 500
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
