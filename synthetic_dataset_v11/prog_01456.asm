; DESCRIPTION: Renders a orange line between points (91, 217) and (205, 234).
; PLAN: r0=91(x1), r1=217(y1), r2=205(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 217
LDI r2, 205
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
