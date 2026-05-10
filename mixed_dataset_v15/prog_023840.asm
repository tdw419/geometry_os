; DESCRIPTION: Renders a orange line between points (130, 124) and (35, 54).
; PLAN: r0=130(x1), r1=124(y1), r2=35(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 124
LDI r2, 35
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
