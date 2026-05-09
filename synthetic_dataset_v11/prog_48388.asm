; DESCRIPTION: Places a purple line segment connecting (43, 197) to (9, 135).
; PLAN: r0=43(x1), r1=197(y1), r2=9(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 197
LDI r2, 9
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
