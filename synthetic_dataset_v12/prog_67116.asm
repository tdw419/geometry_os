; DESCRIPTION: Places a orange line segment connecting (406, 172) to (310, 243).
; PLAN: r0=406(x1), r1=172(y1), r2=310(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 172
LDI r2, 310
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
