; DESCRIPTION: Places a magenta line segment connecting (192, 247) to (376, 227).
; PLAN: r0=192(x1), r1=247(y1), r2=376(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 247
LDI r2, 376
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
