; DESCRIPTION: Renders a black line between points (435, 170) and (507, 104).
; PLAN: r0=435(x1), r1=170(y1), r2=507(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 170
LDI r2, 507
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
