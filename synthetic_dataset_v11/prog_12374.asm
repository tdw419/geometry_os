; DESCRIPTION: Places a blue line segment connecting (57, 105) to (40, 103).
; PLAN: r0=57(x1), r1=105(y1), r2=40(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 105
LDI r2, 40
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
