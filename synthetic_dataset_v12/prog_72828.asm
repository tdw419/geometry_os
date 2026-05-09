; DESCRIPTION: Renders a orange line between points (206, 48) and (216, 233).
; PLAN: r0=206(x1), r1=48(y1), r2=216(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 48
LDI r2, 216
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
