; DESCRIPTION: Renders a blue line between points (22, 117) and (270, 175).
; PLAN: r0=22(x1), r1=117(y1), r2=270(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 117
LDI r2, 270
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
