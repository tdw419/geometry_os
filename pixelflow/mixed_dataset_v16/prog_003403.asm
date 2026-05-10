; DESCRIPTION: Places a white line segment connecting (147, 35) to (247, 136).
; PLAN: r0=147(x1), r1=35(y1), r2=247(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 35
LDI r2, 247
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
