; DESCRIPTION: Places a purple line segment connecting (151, 83) to (187, 160).
; PLAN: r0=151(x1), r1=83(y1), r2=187(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 83
LDI r2, 187
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
