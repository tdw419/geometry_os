; DESCRIPTION: Renders a white line segment connecting (260, 136) to (24, 82).
; PLAN: r0=260(x1), r1=136(y1), r2=24(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 136
LDI r2, 24
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
