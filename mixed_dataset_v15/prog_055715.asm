; DESCRIPTION: Places a magenta line segment connecting (179, 157) to (6, 119).
; PLAN: r0=179(x1), r1=157(y1), r2=6(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 157
LDI r2, 6
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
