; DESCRIPTION: Places a purple line segment connecting (243, 71) to (244, 34).
; PLAN: r0=243(x1), r1=71(y1), r2=244(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 71
LDI r2, 244
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
