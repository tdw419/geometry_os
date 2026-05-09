; DESCRIPTION: Places a purple line segment connecting (74, 25) to (218, 56).
; PLAN: r0=74(x1), r1=25(y1), r2=218(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 25
LDI r2, 218
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
