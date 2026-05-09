; DESCRIPTION: Renders a orange line between points (97, 150) and (433, 88).
; PLAN: r0=97(x1), r1=150(y1), r2=433(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 150
LDI r2, 433
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
