; DESCRIPTION: Places a magenta line segment connecting (185, 132) to (505, 241).
; PLAN: r0=185(x1), r1=132(y1), r2=505(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 132
LDI r2, 505
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
