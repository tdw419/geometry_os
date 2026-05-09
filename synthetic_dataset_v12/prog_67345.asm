; DESCRIPTION: Places a orange line segment connecting (122, 243) to (71, 105).
; PLAN: r0=122(x1), r1=243(y1), r2=71(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 243
LDI r2, 71
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
