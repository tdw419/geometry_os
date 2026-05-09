; DESCRIPTION: Renders a red line between points (15, 112) and (263, 137).
; PLAN: r0=15(x1), r1=112(y1), r2=263(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 112
LDI r2, 263
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
