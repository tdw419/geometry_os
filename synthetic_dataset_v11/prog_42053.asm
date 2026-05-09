; DESCRIPTION: Places a blue line segment connecting (147, 228) to (54, 147).
; PLAN: r0=147(x1), r1=228(y1), r2=54(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 228
LDI r2, 54
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
