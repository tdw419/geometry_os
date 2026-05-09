; DESCRIPTION: Places a magenta line segment connecting (127, 126) to (192, 227).
; PLAN: r0=127(x1), r1=126(y1), r2=192(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 126
LDI r2, 192
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
