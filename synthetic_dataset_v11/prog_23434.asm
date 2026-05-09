; DESCRIPTION: Renders a black line between points (158, 128) and (14, 200).
; PLAN: r0=158(x1), r1=128(y1), r2=14(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 128
LDI r2, 14
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
