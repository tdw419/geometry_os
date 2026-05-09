; DESCRIPTION: Renders a white line between points (399, 194) and (30, 147).
; PLAN: r0=399(x1), r1=194(y1), r2=30(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 194
LDI r2, 30
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
