; DESCRIPTION: Places a blue line segment connecting (70, 223) to (461, 58).
; PLAN: r0=70(x1), r1=223(y1), r2=461(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 223
LDI r2, 461
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
