; DESCRIPTION: Places a white line segment connecting (200, 30) to (36, 90).
; PLAN: r0=200(x1), r1=30(y1), r2=36(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 30
LDI r2, 36
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
