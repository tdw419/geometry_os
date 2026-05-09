; DESCRIPTION: Places a blue line segment connecting (28, 134) to (226, 179).
; PLAN: r0=28(x1), r1=134(y1), r2=226(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 134
LDI r2, 226
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
