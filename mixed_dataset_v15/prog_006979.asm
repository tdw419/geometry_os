; DESCRIPTION: Renders a yellow line between points (296, 175) and (78, 255).
; PLAN: r0=296(x1), r1=175(y1), r2=78(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 175
LDI r2, 78
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
