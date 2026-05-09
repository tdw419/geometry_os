; DESCRIPTION: Places a magenta line segment connecting (16, 88) to (382, 139).
; PLAN: r0=16(x1), r1=88(y1), r2=382(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 88
LDI r2, 382
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
