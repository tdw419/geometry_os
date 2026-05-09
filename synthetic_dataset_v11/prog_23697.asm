; DESCRIPTION: Places a white line segment connecting (219, 158) to (185, 247).
; PLAN: r0=219(x1), r1=158(y1), r2=185(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 158
LDI r2, 185
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
