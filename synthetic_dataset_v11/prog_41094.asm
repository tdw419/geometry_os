; DESCRIPTION: Renders a black line between points (136, 226) and (152, 43).
; PLAN: r0=136(x1), r1=226(y1), r2=152(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 226
LDI r2, 152
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
