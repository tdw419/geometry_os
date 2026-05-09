; DESCRIPTION: Places a white line segment connecting (121, 87) to (147, 59).
; PLAN: r0=121(x1), r1=87(y1), r2=147(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 87
LDI r2, 147
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
