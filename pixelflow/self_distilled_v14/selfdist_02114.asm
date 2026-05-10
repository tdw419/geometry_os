; DESCRIPTION: Renders a white line segment connecting (192, 83) to (89, 91).
; PLAN: r0=192(x1), r1=83(y1), r2=89(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 83
LDI r2, 89
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
