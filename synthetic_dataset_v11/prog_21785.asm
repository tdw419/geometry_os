; DESCRIPTION: Renders a black line between points (49, 4) and (252, 109).
; PLAN: r0=49(x1), r1=4(y1), r2=252(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 4
LDI r2, 252
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
