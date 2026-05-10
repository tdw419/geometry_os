; DESCRIPTION: Renders a purple line between points (242, 227) and (507, 70).
; PLAN: r0=242(x1), r1=227(y1), r2=507(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 227
LDI r2, 507
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
