; DESCRIPTION: Renders a blue line between points (29, 40) and (170, 165).
; PLAN: r0=29(x1), r1=40(y1), r2=170(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 40
LDI r2, 170
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
