; DESCRIPTION: Places a white line segment connecting (501, 88) to (493, 77).
; PLAN: r0=501(x1), r1=88(y1), r2=493(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 88
LDI r2, 493
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
