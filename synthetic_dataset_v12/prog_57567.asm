; DESCRIPTION: Draws a blue line from (319, 92) to (402, 238).
; PLAN: r0=319(x1), r1=92(y1), r2=402(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 92
LDI r2, 402
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
