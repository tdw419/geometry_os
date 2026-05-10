; DESCRIPTION: Places a orange line segment connecting (478, 97) to (492, 161).
; PLAN: r0=478(x1), r1=97(y1), r2=492(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 97
LDI r2, 492
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
