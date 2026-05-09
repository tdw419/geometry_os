; DESCRIPTION: Places a blue line segment connecting (398, 41) to (145, 212).
; PLAN: r0=398(x1), r1=41(y1), r2=145(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 41
LDI r2, 145
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
