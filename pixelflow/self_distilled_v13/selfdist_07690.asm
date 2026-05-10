; DESCRIPTION: Renders a cyan line segment connecting (158, 192) to (34, 148).
; PLAN: r0=158(x1), r1=192(y1), r2=34(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 192
LDI r2, 34
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
