; DESCRIPTION: Renders a orange line between points (58, 80) and (97, 86).
; PLAN: r0=58(x1), r1=80(y1), r2=97(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 80
LDI r2, 97
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
