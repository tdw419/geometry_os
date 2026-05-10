; DESCRIPTION: Places a purple line segment connecting (330, 217) to (10, 213).
; PLAN: r0=330(x1), r1=217(y1), r2=10(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 217
LDI r2, 10
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
