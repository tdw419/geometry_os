; DESCRIPTION: Places a blue line segment connecting (369, 138) to (132, 246).
; PLAN: r0=369(x1), r1=138(y1), r2=132(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 138
LDI r2, 132
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
