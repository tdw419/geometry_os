; DESCRIPTION: Places a purple line segment connecting (77, 39) to (209, 94).
; PLAN: r0=77(x1), r1=39(y1), r2=209(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 39
LDI r2, 209
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
