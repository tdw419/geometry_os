; DESCRIPTION: Places a blue line segment connecting (45, 49) to (40, 16).
; PLAN: r0=45(x1), r1=49(y1), r2=40(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 49
LDI r2, 40
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
