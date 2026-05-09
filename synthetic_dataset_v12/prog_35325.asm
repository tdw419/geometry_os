; DESCRIPTION: Places a blue line segment connecting (2, 16) to (497, 255).
; PLAN: r0=2(x1), r1=16(y1), r2=497(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 16
LDI r2, 497
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
