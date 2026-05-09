; DESCRIPTION: Places a purple line segment connecting (96, 238) to (57, 63).
; PLAN: r0=96(x1), r1=238(y1), r2=57(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 238
LDI r2, 57
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
