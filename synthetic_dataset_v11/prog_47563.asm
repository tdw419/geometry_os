; DESCRIPTION: Places a blue line segment connecting (130, 70) to (19, 28).
; PLAN: r0=130(x1), r1=70(y1), r2=19(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 70
LDI r2, 19
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
