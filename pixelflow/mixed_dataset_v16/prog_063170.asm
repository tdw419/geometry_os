; DESCRIPTION: Renders a white line segment connecting (296, 192) to (2, 34).
; PLAN: r0=296(x1), r1=192(y1), r2=2(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 192
LDI r2, 2
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
