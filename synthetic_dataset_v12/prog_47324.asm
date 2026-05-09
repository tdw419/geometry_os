; DESCRIPTION: Renders a black line between points (158, 109) and (209, 135).
; PLAN: r0=158(x1), r1=109(y1), r2=209(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 109
LDI r2, 209
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
