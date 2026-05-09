; DESCRIPTION: Renders a black line between points (46, 165) and (43, 81).
; PLAN: r0=46(x1), r1=165(y1), r2=43(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 165
LDI r2, 43
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
