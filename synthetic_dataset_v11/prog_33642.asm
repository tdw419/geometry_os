; DESCRIPTION: Places a white line segment connecting (200, 229) to (191, 3).
; PLAN: r0=200(x1), r1=229(y1), r2=191(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 229
LDI r2, 191
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
