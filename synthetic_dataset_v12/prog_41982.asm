; DESCRIPTION: Places a red line segment connecting (331, 165) to (171, 22).
; PLAN: r0=331(x1), r1=165(y1), r2=171(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 165
LDI r2, 171
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
