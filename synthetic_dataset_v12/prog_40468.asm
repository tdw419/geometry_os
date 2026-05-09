; DESCRIPTION: Places a white line segment connecting (169, 104) to (389, 5).
; PLAN: r0=169(x1), r1=104(y1), r2=389(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 104
LDI r2, 389
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
