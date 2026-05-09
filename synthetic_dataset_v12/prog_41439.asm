; DESCRIPTION: Places a white line segment connecting (89, 51) to (350, 85).
; PLAN: r0=89(x1), r1=51(y1), r2=350(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 51
LDI r2, 350
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
