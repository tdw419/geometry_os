; DESCRIPTION: Renders a blue line between points (345, 146) and (423, 88).
; PLAN: r0=345(x1), r1=146(y1), r2=423(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 146
LDI r2, 423
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
