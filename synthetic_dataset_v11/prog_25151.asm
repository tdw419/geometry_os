; DESCRIPTION: Places a blue line segment connecting (38, 40) to (180, 2).
; PLAN: r0=38(x1), r1=40(y1), r2=180(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 40
LDI r2, 180
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
