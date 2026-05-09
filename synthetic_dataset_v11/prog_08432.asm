; DESCRIPTION: Renders a blue line between points (192, 119) and (241, 95).
; PLAN: r0=192(x1), r1=119(y1), r2=241(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 119
LDI r2, 241
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
