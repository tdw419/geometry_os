; DESCRIPTION: Places a blue line segment connecting (84, 116) to (442, 177).
; PLAN: r0=84(x1), r1=116(y1), r2=442(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 116
LDI r2, 442
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
