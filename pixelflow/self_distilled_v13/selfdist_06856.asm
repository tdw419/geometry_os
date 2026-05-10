; DESCRIPTION: Draws a yellow line from (318, 53) to (322, 151).
; PLAN: r0=318(x1), r1=53(y1), r2=322(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 53
LDI r2, 322
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
