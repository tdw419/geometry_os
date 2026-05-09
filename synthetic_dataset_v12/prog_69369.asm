; DESCRIPTION: Places a blue line segment connecting (36, 79) to (303, 122).
; PLAN: r0=36(x1), r1=79(y1), r2=303(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 303
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
