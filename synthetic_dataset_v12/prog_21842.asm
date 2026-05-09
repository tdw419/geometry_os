; DESCRIPTION: Draws a blue line from (331, 163) to (71, 92).
; PLAN: r0=331(x1), r1=163(y1), r2=71(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 163
LDI r2, 71
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
