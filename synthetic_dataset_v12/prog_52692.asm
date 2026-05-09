; DESCRIPTION: Renders a black line between points (184, 91) and (188, 43).
; PLAN: r0=184(x1), r1=91(y1), r2=188(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 91
LDI r2, 188
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
