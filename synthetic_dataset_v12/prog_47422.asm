; DESCRIPTION: Places a blue line segment connecting (246, 251) to (70, 3).
; PLAN: r0=246(x1), r1=251(y1), r2=70(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 251
LDI r2, 70
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
