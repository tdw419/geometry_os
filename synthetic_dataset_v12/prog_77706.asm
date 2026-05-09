; DESCRIPTION: Renders a black line between points (104, 167) and (162, 158).
; PLAN: r0=104(x1), r1=167(y1), r2=162(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 167
LDI r2, 162
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
