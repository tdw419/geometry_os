; DESCRIPTION: Renders a black line between points (195, 165) and (49, 198).
; PLAN: r0=195(x1), r1=165(y1), r2=49(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 165
LDI r2, 49
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
