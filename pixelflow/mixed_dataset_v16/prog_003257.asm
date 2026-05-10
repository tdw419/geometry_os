; DESCRIPTION: Places a orange line segment connecting (353, 57) to (332, 226).
; PLAN: r0=353(x1), r1=57(y1), r2=332(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 332
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
