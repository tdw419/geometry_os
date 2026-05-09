; DESCRIPTION: Renders a blue line between points (102, 249) and (432, 2).
; PLAN: r0=102(x1), r1=249(y1), r2=432(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 249
LDI r2, 432
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
