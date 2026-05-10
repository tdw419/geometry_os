; DESCRIPTION: Renders a orange line between points (216, 133) and (338, 152).
; PLAN: r0=216(x1), r1=133(y1), r2=338(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 133
LDI r2, 338
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
