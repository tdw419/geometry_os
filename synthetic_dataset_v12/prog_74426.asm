; DESCRIPTION: Draws a magenta line from (500, 175) to (322, 114).
; PLAN: r0=500(x1), r1=175(y1), r2=322(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 175
LDI r2, 322
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
