; DESCRIPTION: Draws a blue line from (163, 36) to (503, 131).
; PLAN: r0=163(x1), r1=36(y1), r2=503(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 36
LDI r2, 503
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
