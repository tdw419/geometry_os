; DESCRIPTION: Places a purple line segment connecting (223, 121) to (57, 48).
; PLAN: r0=223(x1), r1=121(y1), r2=57(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 121
LDI r2, 57
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
