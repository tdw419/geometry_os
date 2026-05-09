; DESCRIPTION: Places a purple line segment connecting (271, 122) to (211, 187).
; PLAN: r0=271(x1), r1=122(y1), r2=211(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 122
LDI r2, 211
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
