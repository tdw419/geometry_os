; DESCRIPTION: Draws a yellow line from (419, 57) to (322, 163).
; PLAN: r0=419(x1), r1=57(y1), r2=322(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 57
LDI r2, 322
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
