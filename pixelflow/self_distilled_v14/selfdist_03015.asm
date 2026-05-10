; DESCRIPTION: Draws a yellow line from (322, 77) to (57, 189).
; PLAN: r0=322(x1), r1=77(y1), r2=57(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 77
LDI r2, 57
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
