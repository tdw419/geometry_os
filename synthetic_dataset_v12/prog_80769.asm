; DESCRIPTION: Draws a green line from (322, 139) to (136, 1).
; PLAN: r0=322(x1), r1=139(y1), r2=136(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 139
LDI r2, 136
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
