; DESCRIPTION: Renders a orange line between points (94, 142) and (69, 40).
; PLAN: r0=94(x1), r1=142(y1), r2=69(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 142
LDI r2, 69
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
