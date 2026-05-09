; DESCRIPTION: Places a blue line segment connecting (157, 72) to (180, 13).
; PLAN: r0=157(x1), r1=72(y1), r2=180(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 72
LDI r2, 180
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
