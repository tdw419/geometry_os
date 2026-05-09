; DESCRIPTION: Places a blue line segment connecting (122, 3) to (249, 5).
; PLAN: r0=122(x1), r1=3(y1), r2=249(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 3
LDI r2, 249
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
