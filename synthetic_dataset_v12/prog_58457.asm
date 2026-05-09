; DESCRIPTION: Places a blue line segment connecting (450, 41) to (73, 22).
; PLAN: r0=450(x1), r1=41(y1), r2=73(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 41
LDI r2, 73
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
