; DESCRIPTION: Places a magenta line segment connecting (188, 59) to (195, 84).
; PLAN: r0=188(x1), r1=59(y1), r2=195(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 59
LDI r2, 195
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
