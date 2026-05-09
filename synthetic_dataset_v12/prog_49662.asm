; DESCRIPTION: Renders a black line between points (90, 14) and (188, 115).
; PLAN: r0=90(x1), r1=14(y1), r2=188(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 14
LDI r2, 188
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
