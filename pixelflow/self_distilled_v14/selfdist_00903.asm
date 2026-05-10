; DESCRIPTION: Renders a green line segment connecting (274, 95) to (266, 41).
; PLAN: r0=274(x1), r1=95(y1), r2=266(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 95
LDI r2, 266
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
