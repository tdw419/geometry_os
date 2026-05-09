; DESCRIPTION: Places a purple line segment connecting (135, 199) to (352, 79).
; PLAN: r0=135(x1), r1=199(y1), r2=352(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 199
LDI r2, 352
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
