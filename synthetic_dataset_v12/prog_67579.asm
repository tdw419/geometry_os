; DESCRIPTION: Renders a orange line between points (390, 191) and (125, 192).
; PLAN: r0=390(x1), r1=191(y1), r2=125(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 191
LDI r2, 125
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
