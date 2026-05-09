; DESCRIPTION: Renders a black line between points (407, 91) and (281, 85).
; PLAN: r0=407(x1), r1=91(y1), r2=281(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 91
LDI r2, 281
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
