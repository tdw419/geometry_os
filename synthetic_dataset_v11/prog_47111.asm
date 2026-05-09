; DESCRIPTION: Renders a blue line between points (249, 49) and (175, 70).
; PLAN: r0=249(x1), r1=49(y1), r2=175(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 49
LDI r2, 175
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
