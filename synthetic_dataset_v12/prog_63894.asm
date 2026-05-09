; DESCRIPTION: Places a purple line segment connecting (381, 239) to (200, 213).
; PLAN: r0=381(x1), r1=239(y1), r2=200(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 239
LDI r2, 200
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
