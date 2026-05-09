; DESCRIPTION: Places a purple line segment connecting (72, 174) to (83, 192).
; PLAN: r0=72(x1), r1=174(y1), r2=83(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 174
LDI r2, 83
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
