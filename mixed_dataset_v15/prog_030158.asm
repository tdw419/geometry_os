; DESCRIPTION: Renders a white line segment connecting (194, 106) to (173, 54).
; PLAN: r0=194(x1), r1=106(y1), r2=173(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 106
LDI r2, 173
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
