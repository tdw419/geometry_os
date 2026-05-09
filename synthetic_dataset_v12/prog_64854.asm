; DESCRIPTION: Renders a orange line between points (486, 57) and (390, 152).
; PLAN: r0=486(x1), r1=57(y1), r2=390(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 57
LDI r2, 390
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
