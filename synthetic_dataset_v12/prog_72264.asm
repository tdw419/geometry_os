; DESCRIPTION: Renders a yellow line between points (490, 30) and (322, 95).
; PLAN: r0=490(x1), r1=30(y1), r2=322(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 30
LDI r2, 322
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
