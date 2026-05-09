; DESCRIPTION: Renders a orange line between points (49, 200) and (67, 56).
; PLAN: r0=49(x1), r1=200(y1), r2=67(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 200
LDI r2, 67
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
