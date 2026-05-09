; DESCRIPTION: Places a purple line segment connecting (213, 217) to (57, 206).
; PLAN: r0=213(x1), r1=217(y1), r2=57(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 217
LDI r2, 57
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
