; DESCRIPTION: Places a purple line segment connecting (431, 223) to (492, 26).
; PLAN: r0=431(x1), r1=223(y1), r2=492(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 223
LDI r2, 492
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
