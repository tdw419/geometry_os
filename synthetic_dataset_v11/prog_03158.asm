; DESCRIPTION: Places a white line segment connecting (141, 109) to (106, 122).
; PLAN: r0=141(x1), r1=109(y1), r2=106(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 109
LDI r2, 106
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
