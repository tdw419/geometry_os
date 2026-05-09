; DESCRIPTION: Places a blue line segment connecting (371, 96) to (507, 160).
; PLAN: r0=371(x1), r1=96(y1), r2=507(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 96
LDI r2, 507
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
