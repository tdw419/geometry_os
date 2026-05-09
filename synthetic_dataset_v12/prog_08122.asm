; DESCRIPTION: Renders a black line between points (20, 255) and (162, 118).
; PLAN: r0=20(x1), r1=255(y1), r2=162(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 255
LDI r2, 162
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
