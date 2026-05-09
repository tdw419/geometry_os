; DESCRIPTION: Draws a blue line from (136, 191) to (221, 245).
; PLAN: r0=136(x1), r1=191(y1), r2=221(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 191
LDI r2, 221
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
