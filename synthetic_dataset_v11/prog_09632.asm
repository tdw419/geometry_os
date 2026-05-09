; DESCRIPTION: Renders a yellow line between points (30, 135) and (139, 180).
; PLAN: r0=30(x1), r1=135(y1), r2=139(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 135
LDI r2, 139
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
