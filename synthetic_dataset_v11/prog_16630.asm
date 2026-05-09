; DESCRIPTION: Places a white line segment connecting (49, 71) to (237, 185).
; PLAN: r0=49(x1), r1=71(y1), r2=237(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 71
LDI r2, 237
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
