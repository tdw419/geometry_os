; DESCRIPTION: Draws a blue line from (101, 168) to (141, 60).
; PLAN: r0=101(x1), r1=168(y1), r2=141(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 168
LDI r2, 141
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
