; DESCRIPTION: Places a blue line segment connecting (398, 176) to (18, 69).
; PLAN: r0=398(x1), r1=176(y1), r2=18(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 176
LDI r2, 18
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
