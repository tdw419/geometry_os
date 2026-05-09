; DESCRIPTION: Renders a blue line between points (179, 208) and (9, 101).
; PLAN: r0=179(x1), r1=208(y1), r2=9(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 208
LDI r2, 9
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
