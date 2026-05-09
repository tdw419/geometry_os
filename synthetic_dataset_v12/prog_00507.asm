; DESCRIPTION: Places a orange line segment connecting (306, 19) to (140, 46).
; PLAN: r0=306(x1), r1=19(y1), r2=140(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 19
LDI r2, 140
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
