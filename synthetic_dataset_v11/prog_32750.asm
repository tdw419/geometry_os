; DESCRIPTION: Places a purple line segment connecting (118, 152) to (185, 86).
; PLAN: r0=118(x1), r1=152(y1), r2=185(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 152
LDI r2, 185
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
