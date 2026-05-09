; DESCRIPTION: Places a blue line segment connecting (508, 246) to (300, 29).
; PLAN: r0=508(x1), r1=246(y1), r2=300(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 246
LDI r2, 300
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
