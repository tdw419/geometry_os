; DESCRIPTION: Renders a blue line between points (34, 101) and (7, 202).
; PLAN: r0=34(x1), r1=101(y1), r2=7(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 101
LDI r2, 7
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
