; DESCRIPTION: Places a magenta line segment connecting (8, 128) to (165, 136).
; PLAN: r0=8(x1), r1=128(y1), r2=165(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 128
LDI r2, 165
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
