; DESCRIPTION: Places a blue line segment connecting (203, 41) to (271, 89).
; PLAN: r0=203(x1), r1=41(y1), r2=271(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 41
LDI r2, 271
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
