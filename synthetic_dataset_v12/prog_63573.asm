; DESCRIPTION: Renders a blue line between points (366, 177) and (74, 99).
; PLAN: r0=366(x1), r1=177(y1), r2=74(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 177
LDI r2, 74
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
