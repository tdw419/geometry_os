; DESCRIPTION: Places a blue line segment connecting (408, 240) to (259, 13).
; PLAN: r0=408(x1), r1=240(y1), r2=259(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 240
LDI r2, 259
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
