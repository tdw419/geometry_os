; DESCRIPTION: Renders a orange line between points (403, 91) and (216, 52).
; PLAN: r0=403(x1), r1=91(y1), r2=216(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 91
LDI r2, 216
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
