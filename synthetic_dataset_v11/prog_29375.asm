; DESCRIPTION: Renders a yellow line between points (158, 74) and (30, 43).
; PLAN: r0=158(x1), r1=74(y1), r2=30(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 74
LDI r2, 30
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
