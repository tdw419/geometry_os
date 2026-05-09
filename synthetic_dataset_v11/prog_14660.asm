; DESCRIPTION: Renders a black line between points (97, 94) and (10, 205).
; PLAN: r0=97(x1), r1=94(y1), r2=10(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 94
LDI r2, 10
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
