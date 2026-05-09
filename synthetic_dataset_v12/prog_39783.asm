; DESCRIPTION: Places a orange line segment connecting (136, 47) to (410, 251).
; PLAN: r0=136(x1), r1=47(y1), r2=410(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 47
LDI r2, 410
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
