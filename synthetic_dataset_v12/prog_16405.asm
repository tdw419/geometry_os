; DESCRIPTION: Places a blue line segment connecting (121, 71) to (463, 148).
; PLAN: r0=121(x1), r1=71(y1), r2=463(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 71
LDI r2, 463
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
