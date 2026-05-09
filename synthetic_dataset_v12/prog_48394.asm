; DESCRIPTION: Places a blue line segment connecting (256, 60) to (333, 90).
; PLAN: r0=256(x1), r1=60(y1), r2=333(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 60
LDI r2, 333
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
