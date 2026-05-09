; DESCRIPTION: Places a white line segment connecting (147, 208) to (8, 133).
; PLAN: r0=147(x1), r1=208(y1), r2=8(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 208
LDI r2, 8
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
