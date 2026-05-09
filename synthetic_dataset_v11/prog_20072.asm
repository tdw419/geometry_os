; DESCRIPTION: Places a blue line segment connecting (47, 166) to (138, 105).
; PLAN: r0=47(x1), r1=166(y1), r2=138(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 166
LDI r2, 138
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
