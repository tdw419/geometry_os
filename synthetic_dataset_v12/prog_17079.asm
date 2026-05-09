; DESCRIPTION: Places a purple line segment connecting (243, 223) to (144, 77).
; PLAN: r0=243(x1), r1=223(y1), r2=144(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 223
LDI r2, 144
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
