; DESCRIPTION: Renders a black line between points (191, 9) and (461, 97).
; PLAN: r0=191(x1), r1=9(y1), r2=461(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 9
LDI r2, 461
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
