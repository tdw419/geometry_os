; DESCRIPTION: Renders a orange line between points (389, 230) and (435, 22).
; PLAN: r0=389(x1), r1=230(y1), r2=435(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 230
LDI r2, 435
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
