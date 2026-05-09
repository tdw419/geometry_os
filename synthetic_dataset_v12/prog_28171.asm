; DESCRIPTION: Places a blue line segment connecting (288, 20) to (33, 28).
; PLAN: r0=288(x1), r1=20(y1), r2=33(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 20
LDI r2, 33
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
