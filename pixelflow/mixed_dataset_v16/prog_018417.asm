; DESCRIPTION: Renders a blue line segment connecting (264, 187) to (222, 197).
; PLAN: r0=264(x1), r1=187(y1), r2=222(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 187
LDI r2, 222
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
