; DESCRIPTION: Places a orange line segment connecting (119, 33) to (171, 141).
; PLAN: r0=119(x1), r1=33(y1), r2=171(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 33
LDI r2, 171
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
