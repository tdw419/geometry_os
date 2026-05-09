; DESCRIPTION: Places a blue line segment connecting (88, 28) to (213, 100).
; PLAN: r0=88(x1), r1=28(y1), r2=213(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 28
LDI r2, 213
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
