; DESCRIPTION: Places a purple line segment connecting (97, 213) to (285, 207).
; PLAN: r0=97(x1), r1=213(y1), r2=285(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 213
LDI r2, 285
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
