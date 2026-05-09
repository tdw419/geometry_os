; DESCRIPTION: Places a cyan line segment connecting (426, 223) to (369, 147).
; PLAN: r0=426(x1), r1=223(y1), r2=369(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 223
LDI r2, 369
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
