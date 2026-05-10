; DESCRIPTION: Renders a blue line segment connecting (54, 115) to (240, 25).
; PLAN: r0=54(x1), r1=115(y1), r2=240(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 115
LDI r2, 240
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
