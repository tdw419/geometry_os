; DESCRIPTION: Renders a black line between points (94, 123) and (5, 68).
; PLAN: r0=94(x1), r1=123(y1), r2=5(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 123
LDI r2, 5
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
