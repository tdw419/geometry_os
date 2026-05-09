; DESCRIPTION: Renders a black line between points (135, 144) and (43, 178).
; PLAN: r0=135(x1), r1=144(y1), r2=43(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 144
LDI r2, 43
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
