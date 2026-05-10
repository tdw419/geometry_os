; DESCRIPTION: Draws a magenta line from (90, 230) to (322, 145).
; PLAN: r0=90(x1), r1=230(y1), r2=322(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 230
LDI r2, 322
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
