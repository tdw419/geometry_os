; DESCRIPTION: Places a blue line segment connecting (285, 174) to (407, 71).
; PLAN: r0=285(x1), r1=174(y1), r2=407(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 174
LDI r2, 407
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
