; DESCRIPTION: Places a black line segment connecting (169, 67) to (237, 97).
; PLAN: r0=169(x1), r1=67(y1), r2=237(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 67
LDI r2, 237
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
