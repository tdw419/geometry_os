; DESCRIPTION: Places a purple line segment connecting (40, 174) to (171, 185).
; PLAN: r0=40(x1), r1=174(y1), r2=171(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 174
LDI r2, 171
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
