; DESCRIPTION: Places a blue line segment connecting (491, 85) to (71, 43).
; PLAN: r0=491(x1), r1=85(y1), r2=71(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 85
LDI r2, 71
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
