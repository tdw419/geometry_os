; DESCRIPTION: Places a magenta line segment connecting (444, 226) to (322, 22).
; PLAN: r0=444(x1), r1=226(y1), r2=322(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 226
LDI r2, 322
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
