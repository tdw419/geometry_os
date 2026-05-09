; DESCRIPTION: Renders a blue line between points (482, 187) and (369, 127).
; PLAN: r0=482(x1), r1=187(y1), r2=369(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 187
LDI r2, 369
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
