; DESCRIPTION: Places a magenta line segment connecting (68, 255) to (76, 136).
; PLAN: r0=68(x1), r1=255(y1), r2=76(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 255
LDI r2, 76
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
