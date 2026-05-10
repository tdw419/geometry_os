; DESCRIPTION: Places a purple line segment connecting (143, 153) to (392, 233).
; PLAN: r0=143(x1), r1=153(y1), r2=392(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 153
LDI r2, 392
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
