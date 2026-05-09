; DESCRIPTION: Draws a blue line from (202, 133) to (101, 96).
; PLAN: r0=202(x1), r1=133(y1), r2=101(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 133
LDI r2, 101
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
