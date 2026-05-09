; DESCRIPTION: Places a blue line segment connecting (463, 181) to (111, 81).
; PLAN: r0=463(x1), r1=181(y1), r2=111(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 181
LDI r2, 111
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
