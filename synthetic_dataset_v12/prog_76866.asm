; DESCRIPTION: Renders a white line between points (112, 254) and (484, 95).
; PLAN: r0=112(x1), r1=254(y1), r2=484(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 254
LDI r2, 484
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
