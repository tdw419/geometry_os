; DESCRIPTION: Places a magenta line segment connecting (221, 4) to (192, 101).
; PLAN: r0=221(x1), r1=4(y1), r2=192(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 4
LDI r2, 192
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
