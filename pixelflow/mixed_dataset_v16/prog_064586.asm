; DESCRIPTION: Places a purple line segment connecting (135, 222) to (401, 90).
; PLAN: r0=135(x1), r1=222(y1), r2=401(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 222
LDI r2, 401
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
