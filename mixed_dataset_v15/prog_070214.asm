; DESCRIPTION: Places a purple line segment connecting (345, 61) to (49, 113).
; PLAN: r0=345(x1), r1=61(y1), r2=49(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 61
LDI r2, 49
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
