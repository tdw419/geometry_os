; DESCRIPTION: Renders a orange line between points (94, 28) and (68, 70).
; PLAN: r0=94(x1), r1=28(y1), r2=68(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 28
LDI r2, 68
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
