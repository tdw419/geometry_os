; DESCRIPTION: Renders a white line between points (52, 137) and (490, 106).
; PLAN: r0=52(x1), r1=137(y1), r2=490(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 137
LDI r2, 490
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
