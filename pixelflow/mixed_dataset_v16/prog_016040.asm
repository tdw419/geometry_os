; DESCRIPTION: Places a purple line segment connecting (19, 186) to (435, 141).
; PLAN: r0=19(x1), r1=186(y1), r2=435(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 186
LDI r2, 435
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
