; DESCRIPTION: Places a orange line segment connecting (65, 110) to (171, 142).
; PLAN: r0=65(x1), r1=110(y1), r2=171(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 110
LDI r2, 171
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
