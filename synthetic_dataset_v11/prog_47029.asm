; DESCRIPTION: Places a white line segment connecting (35, 133) to (104, 145).
; PLAN: r0=35(x1), r1=133(y1), r2=104(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 133
LDI r2, 104
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
