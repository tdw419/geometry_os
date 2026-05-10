; DESCRIPTION: Renders a blue line segment connecting (53, 118) to (398, 71).
; PLAN: r0=53(x1), r1=118(y1), r2=398(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 118
LDI r2, 398
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
