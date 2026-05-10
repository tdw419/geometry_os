; DESCRIPTION: Places a purple line segment connecting (387, 222) to (510, 61).
; PLAN: r0=387(x1), r1=222(y1), r2=510(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 222
LDI r2, 510
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
