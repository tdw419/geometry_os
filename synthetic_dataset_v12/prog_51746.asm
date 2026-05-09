; DESCRIPTION: Places a magenta line segment connecting (344, 40) to (451, 51).
; PLAN: r0=344(x1), r1=40(y1), r2=451(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 40
LDI r2, 451
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
