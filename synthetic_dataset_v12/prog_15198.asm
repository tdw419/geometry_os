; DESCRIPTION: Places a blue line segment connecting (376, 81) to (70, 13).
; PLAN: r0=376(x1), r1=81(y1), r2=70(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 81
LDI r2, 70
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
