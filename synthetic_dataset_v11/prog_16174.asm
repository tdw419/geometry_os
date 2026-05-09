; DESCRIPTION: Renders a black line between points (104, 7) and (101, 148).
; PLAN: r0=104(x1), r1=7(y1), r2=101(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 7
LDI r2, 101
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
