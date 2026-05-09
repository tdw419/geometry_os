; DESCRIPTION: Draws a blue line from (54, 113) to (101, 168).
; PLAN: r0=54(x1), r1=113(y1), r2=101(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 113
LDI r2, 101
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
