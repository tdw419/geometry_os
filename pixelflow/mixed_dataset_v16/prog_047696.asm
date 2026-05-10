; DESCRIPTION: Places a blue line segment connecting (60, 32) to (427, 220).
; PLAN: r0=60(x1), r1=32(y1), r2=427(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 32
LDI r2, 427
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
