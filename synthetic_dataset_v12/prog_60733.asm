; DESCRIPTION: Places a purple line segment connecting (14, 69) to (169, 27).
; PLAN: r0=14(x1), r1=69(y1), r2=169(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 69
LDI r2, 169
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
