; DESCRIPTION: Places a purple line segment connecting (273, 88) to (14, 125).
; PLAN: r0=273(x1), r1=88(y1), r2=14(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 88
LDI r2, 14
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
