; DESCRIPTION: Places a blue line segment connecting (492, 100) to (350, 178).
; PLAN: r0=492(x1), r1=100(y1), r2=350(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 100
LDI r2, 350
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
