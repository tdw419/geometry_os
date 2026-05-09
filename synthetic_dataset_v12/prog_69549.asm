; DESCRIPTION: Places a magenta line segment connecting (465, 77) to (451, 121).
; PLAN: r0=465(x1), r1=77(y1), r2=451(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 77
LDI r2, 451
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
