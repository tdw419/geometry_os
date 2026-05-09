; DESCRIPTION: Places a white line segment connecting (140, 9) to (100, 155).
; PLAN: r0=140(x1), r1=9(y1), r2=100(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 9
LDI r2, 100
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
