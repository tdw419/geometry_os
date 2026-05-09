; DESCRIPTION: Places a magenta line segment connecting (54, 195) to (28, 153).
; PLAN: r0=54(x1), r1=195(y1), r2=28(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 195
LDI r2, 28
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
