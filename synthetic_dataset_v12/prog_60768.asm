; DESCRIPTION: Renders a orange line between points (7, 65) and (249, 191).
; PLAN: r0=7(x1), r1=65(y1), r2=249(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 65
LDI r2, 249
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
