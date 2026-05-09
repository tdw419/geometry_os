; DESCRIPTION: Places a blue line segment connecting (0, 71) to (207, 105).
; PLAN: r0=0(x1), r1=71(y1), r2=207(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 71
LDI r2, 207
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
