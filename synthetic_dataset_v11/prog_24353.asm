; DESCRIPTION: Draws a blue line from (22, 188) to (113, 206).
; PLAN: r0=22(x1), r1=188(y1), r2=113(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 188
LDI r2, 113
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
