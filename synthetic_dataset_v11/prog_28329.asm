; DESCRIPTION: Renders a blue line between points (109, 24) and (230, 175).
; PLAN: r0=109(x1), r1=24(y1), r2=230(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 230
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
