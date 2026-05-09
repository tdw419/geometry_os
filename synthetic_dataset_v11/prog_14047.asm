; DESCRIPTION: Places a magenta line segment connecting (192, 131) to (43, 46).
; PLAN: r0=192(x1), r1=131(y1), r2=43(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 131
LDI r2, 43
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
