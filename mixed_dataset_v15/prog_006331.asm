; DESCRIPTION: Places a blue line segment connecting (377, 12) to (246, 132).
; PLAN: r0=377(x1), r1=12(y1), r2=246(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 12
LDI r2, 246
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
