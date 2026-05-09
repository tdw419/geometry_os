; DESCRIPTION: Renders a blue line between points (34, 96) and (252, 144).
; PLAN: r0=34(x1), r1=96(y1), r2=252(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 96
LDI r2, 252
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
