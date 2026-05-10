; DESCRIPTION: Places a purple line segment connecting (205, 217) to (196, 193).
; PLAN: r0=205(x1), r1=217(y1), r2=196(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 217
LDI r2, 196
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
