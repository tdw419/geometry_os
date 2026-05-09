; DESCRIPTION: Places a purple line segment connecting (177, 216) to (74, 107).
; PLAN: r0=177(x1), r1=216(y1), r2=74(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 216
LDI r2, 74
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
