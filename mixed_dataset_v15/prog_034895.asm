; DESCRIPTION: Places a white line segment connecting (22, 200) to (80, 64).
; PLAN: r0=22(x1), r1=200(y1), r2=80(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 200
LDI r2, 80
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
