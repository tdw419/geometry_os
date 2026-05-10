; DESCRIPTION: Places a orange line segment connecting (216, 90) to (52, 55).
; PLAN: r0=216(x1), r1=90(y1), r2=52(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 90
LDI r2, 52
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
