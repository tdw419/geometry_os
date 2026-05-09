; DESCRIPTION: Places a cyan line segment connecting (142, 185) to (147, 123).
; PLAN: r0=142(x1), r1=185(y1), r2=147(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 185
LDI r2, 147
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
