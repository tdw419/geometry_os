; DESCRIPTION: Places a magenta line segment connecting (457, 128) to (300, 243).
; PLAN: r0=457(x1), r1=128(y1), r2=300(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 128
LDI r2, 300
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
