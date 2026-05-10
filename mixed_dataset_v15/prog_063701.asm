; DESCRIPTION: Renders a yellow line between points (303, 9) and (296, 245).
; PLAN: r0=303(x1), r1=9(y1), r2=296(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 9
LDI r2, 296
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
