; DESCRIPTION: Places a yellow line segment connecting (432, 126) to (186, 153).
; PLAN: r0=432(x1), r1=126(y1), r2=186(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 126
LDI r2, 186
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
