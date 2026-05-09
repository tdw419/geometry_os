; DESCRIPTION: Places a yellow line segment connecting (495, 215) to (147, 62).
; PLAN: r0=495(x1), r1=215(y1), r2=147(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 215
LDI r2, 147
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
