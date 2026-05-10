; DESCRIPTION: Renders a white line segment connecting (297, 85) to (220, 191).
; PLAN: r0=297(x1), r1=85(y1), r2=220(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 85
LDI r2, 220
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
