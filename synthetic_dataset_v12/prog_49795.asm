; DESCRIPTION: Draws a blue line from (337, 131) to (158, 208).
; PLAN: r0=337(x1), r1=131(y1), r2=158(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 131
LDI r2, 158
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
