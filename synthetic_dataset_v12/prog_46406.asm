; DESCRIPTION: Renders a black line between points (332, 70) and (101, 24).
; PLAN: r0=332(x1), r1=70(y1), r2=101(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 70
LDI r2, 101
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
