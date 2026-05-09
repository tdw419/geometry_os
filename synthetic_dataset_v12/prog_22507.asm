; DESCRIPTION: Places a purple line segment connecting (103, 25) to (462, 23).
; PLAN: r0=103(x1), r1=25(y1), r2=462(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 25
LDI r2, 462
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
