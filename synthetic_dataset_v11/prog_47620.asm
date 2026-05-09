; DESCRIPTION: Renders a black line between points (95, 144) and (109, 25).
; PLAN: r0=95(x1), r1=144(y1), r2=109(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 144
LDI r2, 109
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
