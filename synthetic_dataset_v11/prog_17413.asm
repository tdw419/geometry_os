; DESCRIPTION: Renders a purple line between points (34, 200) and (242, 167).
; PLAN: r0=34(x1), r1=200(y1), r2=242(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 200
LDI r2, 242
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
