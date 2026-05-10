; DESCRIPTION: Draws a blue line from (425, 131) to (412, 133).
; PLAN: r0=425(x1), r1=131(y1), r2=412(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 131
LDI r2, 412
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
