; DESCRIPTION: Places a magenta line segment connecting (334, 198) to (426, 7).
; PLAN: r0=334(x1), r1=198(y1), r2=426(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 198
LDI r2, 426
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
