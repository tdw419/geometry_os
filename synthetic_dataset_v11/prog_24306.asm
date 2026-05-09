; DESCRIPTION: Places a magenta line segment connecting (8, 139) to (135, 183).
; PLAN: r0=8(x1), r1=139(y1), r2=135(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 139
LDI r2, 135
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
