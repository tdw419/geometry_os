; DESCRIPTION: Draws a blue line from (212, 191) to (92, 54).
; PLAN: r0=212(x1), r1=191(y1), r2=92(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 191
LDI r2, 92
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
