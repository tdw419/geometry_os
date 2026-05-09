; DESCRIPTION: Places a magenta line segment connecting (4, 84) to (376, 223).
; PLAN: r0=4(x1), r1=84(y1), r2=376(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 84
LDI r2, 376
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
