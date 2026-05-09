; DESCRIPTION: Places a yellow line segment connecting (84, 57) to (2, 180).
; PLAN: r0=84(x1), r1=57(y1), r2=2(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 57
LDI r2, 2
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
