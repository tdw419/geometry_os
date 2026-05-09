; DESCRIPTION: Places a blue line segment connecting (69, 187) to (105, 89).
; PLAN: r0=69(x1), r1=187(y1), r2=105(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 187
LDI r2, 105
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
