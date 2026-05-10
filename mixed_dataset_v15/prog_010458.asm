; DESCRIPTION: Renders a blue line between points (416, 114) and (181, 140).
; PLAN: r0=416(x1), r1=114(y1), r2=181(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 114
LDI r2, 181
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
