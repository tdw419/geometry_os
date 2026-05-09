; DESCRIPTION: Places a magenta line segment connecting (468, 195) to (440, 136).
; PLAN: r0=468(x1), r1=195(y1), r2=440(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 195
LDI r2, 440
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
