; DESCRIPTION: Places a blue line segment connecting (12, 18) to (40, 9).
; PLAN: r0=12(x1), r1=18(y1), r2=40(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 18
LDI r2, 40
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
