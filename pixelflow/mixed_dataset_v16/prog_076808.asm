; DESCRIPTION: Places a purple line segment connecting (345, 96) to (387, 244).
; PLAN: r0=345(x1), r1=96(y1), r2=387(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 96
LDI r2, 387
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
