; DESCRIPTION: Renders a green line between points (253, 36) and (507, 106).
; PLAN: r0=253(x1), r1=36(y1), r2=507(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 36
LDI r2, 507
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
